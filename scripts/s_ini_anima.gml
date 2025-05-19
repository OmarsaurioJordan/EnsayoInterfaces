//inicializa las variables para animacion
//arg0: id instancia que llama
//arg1: numero de animaciones
//arg2: true si hay animacion de paso
//arg3: true si hay ciclo de errar IA

with argument0
{
    for (var i = 0; i < argument1; i++)
    {
        reloj_anima[i] = 0;
        anima[i] = 0;
    }
    if argument2
    {
        reloj_paso = irandom(m_segundo * 0.5);
        paso = irandom(3);
    }
    if argument3
    {
        reloj_errar = irandom(m_segundo);
        mov_ia = choose(true, false);
        dir_ia = irandom(359);
    }
}
