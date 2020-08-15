<template>
  <v-app id="inspire">
    <v-app-bar
      app
      color="blue-grey darken-4"
      dark
    >
      <v-app-bar-nav-icon @click.stop="drawer = !drawer"></v-app-bar-nav-icon>
      <v-toolbar-title color="red">FireCloud </v-toolbar-title>
      <v-spacer></v-spacer>
      <v-toolbar-subtitle>Australia Bushfire Live Status</v-toolbar-subtitle>
      
    </v-app-bar>

    <v-main>
      <v-container
        class="fill-height"
        fluid
      >
        <v-row dense class="justify-center">
          <!--v-tooltip bottom>
            <template v-slot:activator="{ on }">
              <v-btn
                :href="source"
                icon
                large
                target="_blank"
                v-on="on"
              >
                <v-icon>mdi-map</v-icon>
              </v-btn>
            </template>
            <span>Map</span>
          </v-tooltip-->
          <FireCloudMap />
        </v-row>

        <!--fire-danger-index :highlights="highlights"></fire-danger-index-->
        
        <v-row dense class="justify-center">
          <v-col class="text-center">
            <v-card :color="alertColor" outlined="true">
                <v-card-text v-text="alertLevel.title"></v-card-text>
                <v-card-title v-text="alertLevel.value" class="justify-center"></v-card-title>
                <v-card-subtitle v-text="alertLevel.subtitle" class="justify-center"></v-card-subtitle>
            </v-card>
          </v-col>
        </v-row>

        <v-row dense class="justify-center">
          <v-col
            v-for="card in cards"
              :key="card.title"
              :cols="card.flex"
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
    </v-main>
    <v-footer
      color="blue-grey darken-4"
      app
    >
      <span class="white--text">FireTec &copy; {{ new Date().getFullYear() }}</span>
    </v-footer>
  </v-app>
</template>

<script>
  //import FireDangerIndex from "./FireDangerIndex.vue";
  import FireCloudMap from "./components/FireCloudMap.vue";

  export default {
    props: {
      source: String,
    },
    components: {
      //"fire-danger-index": FireDangerIndex,
      FireCloudMap,
    },
    data: () => ({
      alertColor: 'blue',
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
    }),
    mounted(){
      console.log("mounted");
      console.log(this.cards[0]['value']);
      var self = this;
      var alertLevels = ['ADVICE', 'WATCH AND ACT', 'EMERGENCY WARNING'];
      var alertLevelColor = ['blue', 'yellow', 'red'];
      var alertLevelDesc = [
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
        3000);
      setInterval(function(){ 
        alertLevelIndex = Math.floor((Math.random() * 3));
        self.alertLevel.value = alertLevels[alertLevelIndex];
        self.alertColor = alertLevelColor[alertLevelIndex];
        self.alertLevel.subtitle = alertLevelDesc[alertLevelIndex];
        }, 
        7000);
    },
  }
</script>
