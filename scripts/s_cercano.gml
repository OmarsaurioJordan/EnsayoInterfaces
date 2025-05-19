// arg0: id quien está buscando
// arg1: distancia de vision
// arg2: objeto a buscar
// ret: id de encontrado o noone

var otro = noone;
var lejos = argument1;
with argument2
{
    var dd = point_distance(x, y, argument0.x, argument0.y);
    if id != argument0 and dd <= lejos
    {
        if !collision_line(x, y, argument0.x, argument0.y, bloque, true, true)
        {
            lejos = dd;
            otro = id;
        }
    }
}
return otro;
