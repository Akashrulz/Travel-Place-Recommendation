<html>
<head>
    <title>Google Maps Places API Nearby Example</title>
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <script>
    $(document).ready(function(){
        // type_holder
        // <div><label><input type="checkbox" class="types" value="mosque" />Mosque</label></div>

        var types = ['airport','amusement_park','aquarium','art_gallery','atm','bar','beauty_salon','bus_station','car_rental','casino','church','hindu_temple','hospital','liquor_store','local_government_office','meal_takeaway','mosque','movie_rental','movie_theater','moving_company','museum','night_club','park','parking','police','post_office','real_estate_agency','restaurant','school','shopping_mall','spa','stadium','subway_station','train_station','travel_agency','university','zoo'];
        var html = '';

        $.each(types, function( index, value ) {
            var name = value.replace(/_/g, " ");
            html += '<div><label><input type="checkbox" class="types" value="'+ value +'" />'+ capitalizeFirstLetter(name) +'</label></div>';
        });

        $('#type_holder').html(html);
    });

    function capitalizeFirstLetter(string) {
        return string.charAt(0).toUpperCase() + string.slice(1);
    }

    var map;
    var infowindow;
    var autocomplete;
    var countryRestrict = {'country': 'in'};
    var selectedTypes = [];

    function initialize()
    {
        autocomplete = new google.maps.places.Autocomplete((document.getElementById('address')), {
            types: ['(regions)'],
           // componentRestrictions: countryRestrict
        });

        var pyrmont = new google.maps.LatLng(18.660992, 73.794050);

        map = new google.maps.Map(document.getElementById('map'), {
            center: pyrmont,
            zoom: 12
        });
    }

    function renderMap()
    {
        // Get the user defined values
        var address = document.getElementById('address').value;
        var radius  = parseInt(document.getElementById('radius').value) * 1000;
        
        // get the selected type
        selectedTypes = [];
        $('.types').each(function(){
            if($(this).is(':checked'))
            {
                selectedTypes.push($(this).val());
            }
        });

        var geocoder    = new google.maps.Geocoder();
        var selLocLat   = 0;
        var selLocLng   = 0;

        geocoder.geocode({'address': address}, function(results, status) {
            if (status === 'OK')
            {
                //console.log(results[0].geometry.location.lat() + ' - ' + results[0].geometry.location.lng());

                selLocLat   = results[0].geometry.location.lat();
                selLocLng   = results[0].geometry.location.lng();

                //var pyrmont = new google.maps.LatLng(52.5666644, 4.7333304);

                var pyrmont = new google.maps.LatLng(selLocLat, selLocLng);

                map = new google.maps.Map(document.getElementById('map'), {
                    center: pyrmont,
                    zoom: 11
                });

                //console.log(selectedTypes);

                var request = {
                    location: pyrmont,
                    //radius: 5000,
                    //types: ["atm"]
                    radius: radius,
                    types: selectedTypes
                };

                infowindow = new google.maps.InfoWindow();

                var service = new google.maps.places.PlacesService(map);
                service.nearbySearch(request, callback);
            }
            else
            {
                alert('Geocode was not successful for the following reason: ' + status);
            }
        });
    }

    function callback(results, status)
    {
        if (status == google.maps.places.PlacesServiceStatus.OK)
        {
            for (var i = 0; i < results.length; i++)
            {
                createMarker(results[i], results[i].icon);
            }
        }
    }

    function createMarker(place, icon) {
        var placeLoc = place.geometry.location;

        var marker = new google.maps.Marker({
            map: map,
            position: place.geometry.location,
            icon: {
                url: icon,
                scaledSize: new google.maps.Size(20, 20) // pixels
            },
            animation: google.maps.Animation.DROP
        });
        
        google.maps.event.addListener(marker, 'click', function() {
            infowindow.setContent(place.name+ '<br>' +place.vicinity);
            infowindow.open(map, this);
        });
    }
    </script>
</head>
<body>

<div style="float: right;">
    <div id="map" style="width:900px; height:600px;"></div>
</div>

<div style="float: left; width: 400;">
    <form name="frm_map" id="frm_map">
        <table>
            <tr>
                <th>Address</th>
                <td>
                    <input type="text" name="address" id="address" value="Pune">
                </td>
            </tr>
            <tr>
                <th>Radius</th>
                <td>
                    <input type="text" name="radius" id="radius" value="5" placeholder="In KM">
                </td>
            </tr>
            <tr>
                <th>Types</th>
                <td>
                    <div id="type_holder" style="height: 200px; overflow-y: scroll;">
                        <!-- Dynamic Content -->    
                    </div>
                </td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <input type="button" value="Show" id="submit" onclick="renderMap();">
                    <input type="reset" value="Reset">
                </td>
            </tr>
        </table>
    </form>
</div>

</body>
</html>