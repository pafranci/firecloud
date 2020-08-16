<template>
  <v-app id="inspire">
    <v-app-bar
      app
      color="blue-grey darken-4"
      dark
    >
      <v-app-bar-nav-icon @click.stop="drawer = !drawer"></v-app-bar-nav-icon>
      <v-toolbar-title class="v-step-0">FireCloud</v-toolbar-title>
      <v-spacer class="v-step-6"></v-spacer>
      <v-toolbar-subtitle>Australia Bushfire Live Status</v-toolbar-subtitle> 
      <v-tour name="myTour" :steps="steps"></v-tour>  
    </v-app-bar>

    <v-main>
      <v-container class="fill-height" fluid>

        <v-row dense class="justify-center">
          <FireCloudMap class="v-step-1 v-step-4 v-step-5"/>
        </v-row>
        
        <v-row dense class="justify-center v-step-2">
          <v-col class="text-center">
            <v-card :color="alertColor" :outlined="true" > 
                <v-card-text v-text="alertLevel.title"></v-card-text>
                <v-card-title v-text="alertLevel.value" class="justify-center"></v-card-title>
                <v-card-subtitle v-text="alertLevel.subtitle" class="justify-center"></v-card-subtitle>
            </v-card>
          </v-col>
        </v-row>
        
        <v-container :fluid="true">
          <v-row dense class="justify-center v-step-3">
            <v-col
              v-for="card in cards"
              :key="card.title"
              :cols="cardFlex"
              class="text-center"
            >
              <v-card>
                  <v-card-text v-text="card.title"></v-card-text>
                  <v-card-title v-text="card.value" class="justify-center"></v-card-title>
                  <v-card-subtitle v-text="card.subtitle" class="justify-center"></v-card-subtitle>
              </v-card>
            </v-col>
          </v-row>
        </v-container>
      </v-container>
    </v-main>
    <v-footer 
      color="blue-grey darken-4"
      app
    >
      <span class="white--text v-step-7">FireTec &copy; {{ new Date().getFullYear() }}</span>
    </v-footer>
  </v-app>
</template>

<script>
  import FireCloudMap from "./components/FireCloudMap.vue";
  export default {
    props: {
      source: String,
    },
    components: {
      FireCloudMap,
    },
    data: () => ({
      alertColor: 'blue',
      cardFlex: 2,
      alertLevel: 
        { title: 'Bushfire Alert Level', 
          color:'blue', 
          subtitle:'A fire has started but there is no immediate threat to lives or homes. Be aware and keep up to date.', 
          value: 'ADVICE', 
          flex: 2 },
      cards: [
        { title: 'Last Rainfall', value: '6 days ago', flex: 2 },
        { title: 'Temperature (C)', value: '30', flex: 2 },
        { title: 'Wind Speed (km/hr)', value: '11', flex: 2  },
        { title: 'Wind Direction', value: 'WSW', flex: 2  },
        { title: 'Humidity (%)', value: '81', flex: 2 },
      ],
      steps: [
          {
            target: '.v-step-0',  // We're using document.querySelector() under the hood
            header: {
              title: 'G\'day Judges!',
            },
            content: `Discover <strong>FireCloud</strong>!`
          },
          {
            target: '.v-step-1',
            content: 'This map shows the status of FireCloud sensors deployed in bushfire prone areas such as those identified by NSW’s BushFire Prone Land dataset or Victoria’s Designated Bushfire Prone Area dataset.'
          },
          {
            target: '.v-step-2',
            content: 'Each sensor is able to calculate the Bushfire Alert Level for its location. On the hardware side, FireCloud is a system of LPWAN IoT devices composed of sensor node pairs.'
          },
          {
            target: '.v-step-3',
            content: 'The Bushfire Alert Level is computed based on real-time data gathered by the sensors combined with historical terrain data (such as land classification and elevation) and weather data (such as date of last rainfall) to simulate fire movement using existing rate-of-spread models.'
          },
          {
            target: '.v-step-4',
            content: 'During bushfire season, FireCloud allows the Fire Service and concerned citizens to detect fires and pinpoint its exact location within minutes. They can also follow the movement of the fires in real time.'
          },
          {
            target: '.v-step-5',
            content: 'When a danger threshold is met, the system broadcast emergency SMS alerts to cellular phones within a certain risk radius of the fires using uses TelstraDev’s Messaging API.'
          },
          {
            target: '.v-step-6',
            content: ' Off season, FireCloud can be used to assess the ecological condition of an area by using a regression model based on CSIRO’s data on habitat condition scores. This allows state and local authorities to concentrate reforestation efforts on the most vulnerable sites. '
          },
          {
            target: '.v-step-7',
            content: ' Thank you! Source code available at https://github.com/pafranci/firecloud #GovHack2020' 
          },
        ]
    }),
    created () {
      document.title = 'FireCloud'
    },
    mounted(){
      console.log("mounted");

      // Make responsive. Adjust to window size.
      if (window.innerWidth < 600) {
        this.cardFlex = 12
      }

      // Start product tour
      this.$tours['myTour'].start();

      // Simulate sensor feeds
      var self = this;
      var alertLevels = ['ALL CLEAR', 'ADVICE', 'WATCH AND ACT', 'EMERGENCY WARNING'];
      var alertLevelColor = ['white','blue', 'yellow', 'red'];
      var alertLevelDesc = [
        'Take care to avoid any dangers and keep up to date.',
        'A fire has started but there is no immediate threat to lives or homes. Be aware and keep up to date.',
        'There is a possible threat to lives or homes. You need to leave or get ready to defend-do not wait and see.',
        'You are in danger and need to take immediate action to survive. There is a threat to lives or homes.'
      ];
      var alertLevelIndex = 0;
      var windDirection = ['N','NNE','NE','ENE','E','ESE','SE','SSE','S','SSW','SW','WSW','W','WNW','NW','NNW']
      setInterval(function(){         
        self.cards[1].value = Math.floor((Math.random() * 40) + 30);
        self.cards[2].value = Math.floor((Math.random() * 10) + 1);
        self.cards[3].value = windDirection[Math.floor((Math.random() * 16))];
        self.cards[4].value = Math.floor((Math.random() * 100) + 1);
        }, 
        5000);
      setInterval(function(){ 
        alertLevelIndex = Math.floor((Math.random() * 4));
        self.alertLevel.value = alertLevels[alertLevelIndex];
        self.alertColor = alertLevelColor[alertLevelIndex];
        self.alertLevel.subtitle = alertLevelDesc[alertLevelIndex];
        }, 
        20000);
    },
  }
</script>
