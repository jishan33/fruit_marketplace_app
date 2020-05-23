import { icon } from './icon'
import { tileLayer } from './tileLayer'
import L from 'leaflet'


const renderMap = async (search) => {
  const url = search ? `/farm_locations/map/${search}` : `/farm_locations?type=json`
  const response = await fetch(url)
  const { data, center } = await response.json()
  const map = await tileLayer(center)
  const markers = data.map((location) => {
    return L.marker([location[0], location[1]], {icon: icon})
  })
  L.featureGroup(markers).addTo(map)
}

renderMap()