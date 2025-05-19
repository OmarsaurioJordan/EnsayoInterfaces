// arg0: personaje que llama

with argument0
{
    if xprevious != x or yprevious != y
    {
        draw_sprite(d_pies, paso, x, y);
    }
    else
    {
        draw_sprite(d_pies, 0, x, y);
    }
    var cm = 0;
    if cumplio and (tipo == m_donante or tipo == m_ladron)
    {
        cm = 7;
    }
    draw_sprite(d_personajes, tipo + cm, x, y);
}
