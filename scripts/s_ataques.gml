// arg0: personaje quien llama

with argument0
{
    switch tipo
    {
        case m_ciudadano: ataque = control.minataque; break;
        case m_turista: ataque = control.minataque; break;
        case m_soldado: ataque = control.minataque * 4; break;
        case m_obrero: ataque = control.minataque * 1.5; break;
        case m_brujo: ataque = control.minataque * 1.25; break;
        case m_donante: ataque = control.minataque * 0; break;
        case m_defensa: ataque = control.minataque * 4; break;
        case m_ladron: ataque = control.minataque * 0.5; break;
        case m_raro: ataque = control.minataque * 0.5; break;
        case m_enemigo: ataque = control.minataque * 4; break;
        case m_bomba: ataque = control.minataque * 0; vida *= 4; break;
        case m_animal: ataque = control.minataque * 5; break;
    }
    if dequien == ""
    {
        dequien = control.nombre;
    }
}
