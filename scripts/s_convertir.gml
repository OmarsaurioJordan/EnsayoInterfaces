// arg0: id edifico que convierte
// arg1: tipo de personaje a crear
// arg2: distancia de conversion
// ret: tiempo para la proxima conversion

var n = 0;
with personaje_a
{
    if tipo == argument1
    {
        n++;
    }
}
if n < control.solporcu * instance_number(argument0.object_index)
{
    var yes = true;
    with personaje_a
    {
        if tipo == m_ciudadano and yes
        {
            if point_distance(x, y, argument0.x, argument0.y) <= argument2
            {
                var aux = instance_create(x, y, personaje_a);
                aux.tipo = argument1;
                yes = false;
                instance_destroy();
            }
        }
    }
}
var r = room_speed * 5 + irandom(room_speed);
return r;
