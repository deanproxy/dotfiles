
const rest = require('rest');
const mime = require('rest/interceptor/mime');

const APIKEY = 'c7cee422559a135db5f0259e791dfae3';
const ZIPCODE = '30115';

const client = rest.wrap(mime);

const sunnyIcon = "";
const cloudyIcon = "";

client(`http://api.openweathermap.org/data/2.5/weather?zip=${ZIPCODE}&units=imperial&APPID=${APIKEY}`)
   .then(response => {
      const info = response.entity;
      const icon = info.weather.main === 'clouds' ? cloudyIcon : sunnyIcon;
      let output = `${icon} ${Math.round(info.main.temp)}F`;
      console.log(output);
   });
