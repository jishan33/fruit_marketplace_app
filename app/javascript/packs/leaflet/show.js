import { icon } from './icon'
import { tileLayer } from './tileLayer'
import L from 'leaflet'


const renderMap = async () => {
  const id = location.pathname.split("/")[2]
  const response = await fetch(`/farm_locations/${id}?type=json`)
  const { data } = await response.json()
  debugger;
  const map = await tileLayer(data)
  L.marker([data[0], data[1]], {icon: icon}).addTo(map)
}

renderMap()