//reloj de animacion para sprites de subimagenes
//arg0: id instancia que llama
//arg1: tiempo de ciclo fijo de reloj
//arg2: cuantas sub-imagenes son

with argument0
{
    reloj_paso += delta_time;
    if reloj_paso >= argument1
    {
        reloj_paso -= argument1;
        
        paso++;
        if paso >= argument2
        {
            paso = 0;
        }
    }
}
