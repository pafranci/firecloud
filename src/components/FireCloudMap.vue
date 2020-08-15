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
	:icon="m.icon === 'red' ? fireMarker : (m.icon === 'green' ? greenMarker : orangeMarker)"
        :clickable="true"
        :draggable="true"
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
      markerWidth: 24,
      markerHeight: 24,
      markers: [
        {
          position: {
            lat: -30.43850781283099,
            lng: 142.16840231249998,
          },
          icon: 'orange',
        },
        {
          position: {
            lat: -30.073447998941187,
            lng: 145.23324453662107,
          },
          icon: 'orange',
        },
        {
          position: {
            lat: -35.083296620753956,
            lng: 145.56317770312498,
          },
          icon: 'green',
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
      ],
    }
  },
  computed: {
    fireMarker() {
      return {
        url: 'https://image.flaticon.com/icons/png/128/785/785116.png',
        scaledSize: {
          width: this.markerWidth,
          height: this.markerHeight,
        },
      }
    },
    orangeMarker() {
      return {
        url: 'https://upload.wikimedia.org/wikipedia/commons/thumb/9/91/Location_dot_orange.svg/600px-Location_dot_orange.svg.png',
        scaledSize: {
          width: this.markerWidth,
          height: this.markerHeight,
        },
      }
    },
    greenMarker() {
      return {
        url: 'https://miro.medium.com/max/512/1*nZ9VwHTLxAfNCuCjYAkajg.png',
        scaledSize: {
          width: this.markerWidth,
          height: this.markerHeight,
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
      this.count = (this.count + 1) % 50
      this.markerWidth = this.markerHeight = ((this.count / 100) * 32) + 20
    }, 40)
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
