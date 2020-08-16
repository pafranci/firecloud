<template>
  <div class="fire-cloud-map" style="text-align: center">
    <GmapMap
        :center="mapCenter"
        :zoom="6"
        map-type-id="terrain"
        :style="mapStyle"
    >
      <GmapMarker
        v-for="(m, index) in markers"
        :key="index"
        :position="m.position"
	:icon="m.icon === 'red' ? redMarker : (m.icon === 'blue' ? blueMarker : (m.icon === 'yellow' ? yellowMarker : whiteMarker))"
        :clickable="true"
        @click="latCenter = m.position.lat; lngCenter = m.position.lng"
      />
    </GmapMap>
  </div>
</template>

<script>
export default {
  name: 'FireCloudMap',
  data() {
    return {
      count: 0,
      mapWidth: '1px',
      mapHeight: '1px',
      latCenter: -32.50908265460871,
      lngCenter: 147.14520895312498,
      markerWidth: 32,
      markerHeight: 32,
      markers: [
        {
          position: {
            lat: -30.43850781283099,
            lng: 142.16840231249998,
          },
          icon: 'yellow',
        },
        {
          position: {
            lat: -30.073447998941187,
            lng: 145.23324453662107,
          },
          icon: 'yellow',
        },
        {
          position: {
            lat: -35.083296620753956,
            lng: 145.56317770312498,
          },
          icon: 'blue',
        },
        {
          position: {
            lat: -33.646250970395734,
            lng: 142.98104727099607,
          },
          icon: 'red',
        },
        {
          position: {
            lat: -33.480323232423295,
            lng: 143.6251207573242,
          },
          icon: 'red',
        },
        {
          position: {
            lat: -31.77946952696155,
            lng: 149.83507969290247,
          },
          icon: 'white',
        },
      ],
    }
  },
  computed: {
    redMarker() {
      return {
        url: require('../assets/redIcon.png'),
        scaledSize: {
          width: this.markerWidth,
          height: this.markerHeight,
        },
        anchor: {
          x: 21,
          y: 21,
        },
      }
    },
    yellowMarker() {
      return {
        url: require('../assets/yellowIcon.png'),
        scaledSize: {
          width: this.markerWidth,
          height: this.markerHeight,
        },
        anchor: {
          x: 21,
          y: 21,
        },
      }
    },
    blueMarker() {
      return {
        url: require('../assets/blueIcon.png'),
        scaledSize: {
          width: this.markerWidth,
          height: this.markerHeight,
        },
        anchor: {
          x: 21,
          y: 21,
        },
      }
    },
    whiteMarker() {
      return {
        url: require('../assets/whiteIcon.png'),
        scaledSize: {
          width: this.markerWidth,
          height: this.markerHeight,
        },
        anchor: {
          x: 21,
          y: 21,
        },
      }
    },
    mapStyle() {
      return {
        width: this.mapWidth,
        height: this.mapHeight,
      }
    },
    mapCenter() {
      return {
        lat: this.latCenter,
        lng: this.lngCenter,
      }
    },
  },
  mounted() {
    this.mapWidth = (window.innerWidth) + 'px'
    this.mapHeight = (window.innerHeight*2/3 - 100) + 'px'
    window.setInterval(() => {
      this.count = (this.count + 1) % 50 + 50
      this.markerWidth = this.markerHeight = ((this.count / 100) * 14)
    }, 40)

    // NSW
    for (let i = 0; i < 40; ++i) {
      this.markers.push({
        position: {
          lat: -33.480323232423295 + Math.random() * 1.5,
          lng: 141.6251207573242 + Math.random() * 3.5,
        },
        icon: 'red',
      })
    }
    for (let i = 0; i < 20; ++i) {
      this.markers.push({
        position: {
          lat: -30.43850781283099 + Math.random() * 1,
          lng: 142.16840231249998 + Math.random() * 3,
        },
        icon: 'yellow',
      })
    }
    for (let i = 0; i < 10; ++i) {
      this.markers.push({
        position: {
          lat: -35.08329662075399 + Math.random() * 1,
          lng: 145.56317770312498 + Math.random() * 3,
        },
        icon: 'blue',
      })
    }
    for (let i = 0; i < 10; ++i) {
      this.markers.push({
        position: {
          lat: -31.77946952696155 + Math.random() * 1,
          lng: 149.83507969290247 + Math.random() * 3,
        },
        icon: 'white',
      })
    }

    // VIC
    for (let i = 0; i < 20; ++i) {
      this.markers.push({
        position: {
          lat: -37.54066279310928 + Math.random() * 1,
          lng: 146.03223237386703 + Math.random() * 3,
        },
        icon: 'red',
      })
    }
    for (let i = 0; i < 5; ++i) {
      this.markers.push({
        position: {
          lat: -37.82126193493862 + Math.random() * 0.5,
          lng: 144.8486611928303 + Math.random() * 0.5,
        },
        icon: 'blue',
      })
    }
    for (let i = 0; i < 20; ++i) {
      this.markers.push({
        position: {
          lat: -34.809130292658324 - Math.random() * 2,
          lng: 141.78086908892567 + Math.random() * 3,
        },
        icon: 'yellow',
      })
    }
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
h3 {
  margin: 40px 0 0;
}
ul {
  list-style-type: none;
  padding: 0;
}
li {
  display: inline-block;
  margin: 0 10px;
}
a {
  color: #42b983;
}
</style>
