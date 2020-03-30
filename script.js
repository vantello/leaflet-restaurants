var map = L.map('mapid').on('load', onMapLoad).setView([41.400, 2.206], 9);
//map.locate({setView: true, maxZoom: 17});
	
var tiles = L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {}).addTo(map);

//en el clusters almaceno todos los markers
var markers = L.markerClusterGroup();
var data_markers = [];

async function onMapLoad() {

	console.log("Mapa cargado");
    /*
	FASE 3.1
		1) Relleno el data_markers con una petición a la api
		2) Añado de forma dinámica en el select los posibles tipos de restaurantes
		3) Llamo a la función para --> render_to_map(data_markers, 'all'); <-- para mostrar restaurantes en el mapa
	*/

	let response = await fetch("http://localhost/mapa/api/apiRestaurants.php");
	data_markers = await response.json();
	console.log(data_markers);

	for (item of data_markers) {
		markers.addLayer(L.marker([item.lat, item.lng])
		.bindPopup("<b>"+ item.name + "</b><br>" + item.address));	
	}
	map.addLayer(markers);


	// Extract kind of food of each restaurant
	var kindFood = [];
	for (let i=0; i<data_markers.length; i++) {
		var splitArray = data_markers[i].kind_food.split(',');
		kindFood.push(splitArray);
	}
	console.log(kindFood);

	//Array with all kind of restaurants of all the restaurants.
	//If two restaurants have the same kind of food, array have this item twice.
	var allKindsOfFood = [];
	for(var i = 0; i < kindFood.length; i++) {
		allKindsOfFood = allKindsOfFood.concat(kindFood[i]);
	}
	console.log(allKindsOfFood);

	//no repeat and order kind of food to insert in option value
	var arrayToSet = new Set(allKindsOfFood);
	var finalKindFood = Array.from(arrayToSet);
	finalKindFood.sort();
	finalKindFood.unshift("All Restaurants");
	console.log(finalKindFood);
	for (let i=0; i<finalKindFood.length; i++) {
		$("#kind_food_selector").append("<option>" + finalKindFood[i] + "</option>");
		}


}	

function render_to_map(data_markers,filter){
	console.log(data_markers);
	/*
	FASE 3.2
		1) Limpio todos los marcadores
		2) Realizo un bucle para decidir que marcadores cumplen el filtro, y los agregamos al mapa
	*/	
	markers.clearLayers();
	for (item of data_markers) {
		console.log(item.kind_food);
		if (item.kind_food.includes(filter)) {
			markers.addLayer(L.marker([item.lat, item.lng])
				.bindPopup("<b>"+ item.name + "</b><br>" + item.address + "<br>" + item.kind_food));
		} 
	}
	map.addLayer(markers); 
			
}

$('#kind_food_selector').on('change', function() {
	console.log(this.value);
	render_to_map(data_markers, this.value);
  });