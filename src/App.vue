<template>
  <v-app id="inspire">
    <v-app-bar
      app
      color="indigo"
      dark
    >
      <v-app-bar-nav-icon @click.stop="drawer = !drawer"></v-app-bar-nav-icon>
      <v-toolbar-title>FirePath NSW Bushfire Live Status</v-toolbar-title>
    </v-app-bar>

    <v-main>
      <v-container
        class="fill-height"
        fluid
      >
      <v-row dense class="justify-center">
        <v-tooltip bottom>
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
        </v-tooltip>
      </v-row>

      <!--fire-danger-index :highlights="highlights"></fire-danger-index-->

        <v-row dense>
          <v-col
            v-for="card in cards"
              :key="card.title"
              :cols="card.flex"
            class="text-center"
          >
            <v-card>
              <!--v-img
                :src="card.src"
                class="white--text align-end"
                gradient="to bottom, rgba(0,0,0,.1), rgba(0,0,0,.5)"
                height="200px"
              -->
                <v-card-text v-text="card.title"></v-card-text>
                <v-card-title v-text="card.value" class="justify-center"></v-card-title>

              <!--/v-img-->
            </v-card>
          </v-col>
        </v-row>
      </v-container>
    </v-main>
    <v-footer
      color="indigo"
      app
    >
      <span class="white--text">FireTec &copy; {{ new Date().getFullYear() }}</span>
    </v-footer>
  </v-app>
</template>

<script>
  //import FireDangerIndex from "./FireDangerIndex.vue";

  export default {
    props: {
      source: String,
    },
    components:{
      //"fire-danger-index": FireDangerIndex,
    },
    data: () => ({
      cards: [
        { title: 'Status', value: 'Fire Ongoing', flex: 3  },
        { title: 'Fire Danger Index', value: '2', flex: 6 },
        { title: 'Last Rainfall', value: '6 days ago', flex: 3 },
        { title: 'Temperature (C)', value: '30', flex: 3 },
        { title: 'Wind Speed (km/hr)', value: '11 km/h', flex: 3  },
        { title: 'Wind Direction', value: 'WSW', flex: 3  },
        { title: 'Humidity (%)', value: '81', flex: 3 },
      ],
    }),
    mounted(){
      console.log("mounted");
      console.log(this.cards[0]['value']);
      var self = this;
      var windDirection = ['N','NNE','NE','ENE','E','ESE','SE','SSE','S','SSW','SW','WSW','W','WNW','NW','NNW']
      setInterval(function(){ 
        console.log("setInterval");
        self.cards[1].value = Math.floor((Math.random() * 10) + 1);
        self.cards[3].value = Math.floor((Math.random() * 40) + 30);
        self.cards[4].value = Math.floor((Math.random() * 10) + 1);
        self.cards[5].value = windDirection[Math.floor((Math.random() * 16))];
        self.cards[6].value = Math.floor((Math.random() * 100) + 1);
        }, 
        3000);
    },
    
  }
</script>