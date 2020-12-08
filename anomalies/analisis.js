const csv = require('csv-parser');
const exportCSV = require('json2csv');
const fs = require('fs');
const {plot, stack, clear } = require('nodeplotlib');
let mexico = [];
fs.createReadStream('mexico.csv')
  .pipe(csv())
  .on('data', (row) => {
    let {lat,long,name} = row;
    mexico.push({ lat:parseFloat(lat),long:parseFloat(long),name:name});
  })
  .on('end', () => {
    console.log('> importados');
    let m = calcDistance(mexico);
    const csv = exportCSV.parse(m);
    fs.writeFile('distanceMexico.csv',csv, function (err) {
      if (err) return console.log(err);
      console.log('csv > mexicoWithDistance');
    });
    data = [{x: m.map( r => r.lat), y: m.map(r => r.rv), type: 'scatter'}];
    plot(data);
  });
function calcDistance(mexico){
  let mexicoFixing =  mexico //Ordenar los datos
  .sort( (l1,l2) => { 
    return (l1.lat+l1.long < l2.lat+l2.long) ? -1 : 1;
  })
  .map((location, index, element) =>{ //agregar los vecinos cercanos deacuerdo al orden
    return { location:location, v1:element[index+1], v2: element[index+2]};
  });
  //arreglar el index -1 y -2 null de los ultimos en el arreglo
  mexicoFixing[mexico.length-2].v2 = mexicoFixing[mexico.length-4].location;
  mexicoFixing[mexico.length-1].v1 = mexicoFixing[mexico.length-2].location;
  mexicoFixing[mexico.length-1].v2 = mexicoFixing[mexico.length-3].location;
  //calcular las distancias
  return mexicoFixing.map((l) => {
      let {location, v1, v2} = l;
      let d1 = Math.sqrt( Math.pow( v1.lat - location.lat,2) + Math.pow(v1.long- location.long,2));
      let d2 = Math.sqrt( Math.pow( v2.lat - location.lat,2) + Math.pow(v2.long- location.long,2));
      let rv = -1;
      if(d1 != 0){
        rv = d2/d1;
      }
      return { lat:location.lat, long:location.long, d1:d1, d2:d2, rv:rv,name:location.name };
  });
}
// antonio.neme@iimas.unam.mx
