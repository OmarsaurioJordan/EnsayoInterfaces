// arg0: instancia que llama

with argument0
{
// relojes de animacion y errar al azar
s_anima_paso(id, m_segundo * 0.1, 4);
s_errar(id, m_segundo * 2, m_segundo, 45, 0.3, 0.6);

// detectar colision con cosas y personajes
var otro = instance_place(x, y, bloque);
if otro == noone
{
    otro = instance_place(x, y, movil);
    if otro != noone
    {
        // pelear con enemigos
        if hit
        {
            switch tipo
            {
                case m_ciudadano:
                case m_turista:
                case m_obrero:
                    switch otro.tipo
                    {
                        case m_enemigo:
                        case m_animal:
                        case m_bomba:
                            vida -= otro.ataque;
                            otro.vida -= ataque;
                            hit = false; alarm[1] = room_speed + irandom(room_speed);
                        break;
                    }
                    break;
                
                case m_brujo:
                    switch otro.tipo
                    {
                        case m_enemigo:
                        case m_animal:
                        case m_bomba:
                        case m_raro:
                            vida -= otro.ataque;
                            otro.vida -= ataque;
                            hit = false; alarm[1] = room_speed + irandom(room_speed);
                        break;
                    }
                    break;
                
                case m_soldado:
                case m_defensa:
                    switch otro.tipo
                    {
                        case m_enemigo:
                        case m_animal:
                        case m_ladron:
                        case m_bomba:
                        case m_raro:
                            vida -= otro.ataque;
                            otro.vida -= ataque;
                            hit = false; alarm[1] = room_speed + irandom(room_speed);
                        break;
                    }
                    break;
                
                case m_enemigo:
                case m_animal:
                    switch otro.tipo
                    {
                        case m_ciudadano:
                        case m_turista:
                        case m_obrero:
                        case m_brujo:
                        case m_soldado:
                        case m_defensa:
                        case m_donante:
                            vida -= otro.ataque;
                            otro.vida -= ataque;
                            hit = false; alarm[1] = room_speed + irandom(room_speed);
                        break;
                    }
                    break;
                
                case m_donante:
                    switch otro.tipo
                    {
                        case m_enemigo:
                        case m_animal:
                            vida -= otro.ataque;
                            otro.vida -= ataque;
                            hit = false; alarm[1] = room_speed + irandom(room_speed);
                        break;
                    }
                    break;
                
                case m_ladron:
                    switch otro.tipo
                    {
                        case m_soldado:
                        case m_defensa:
                            vida -= otro.ataque;
                            otro.vida -= ataque;
                            hit = false; alarm[1] = room_speed + irandom(room_speed);
                        break;
                    }
                    break;
                
                case m_raro:
                    switch otro.tipo
                    {
                        case m_soldado:
                        case m_defensa:
                        case m_brujo:
                            vida -= otro.ataque;
                            otro.vida -= ataque;
                            hit = false; alarm[1] = room_speed + irandom(room_speed);
                        break;
                    }
                    break;
                
                case m_bomba:
                    switch otro.tipo
                    {
                        case m_ciudadano:
                        case m_turista:
                        case m_obrero:
                        case m_brujo:
                        case m_soldado:
                        case m_defensa:
                            vida -= otro.ataque;
                            otro.vida -= ataque;
                            hit = false; alarm[1] = room_speed + irandom(room_speed);
                        break;
                    }
                    break;
            }
            if !hit
            {
                instance_create(x, y, sangre);
            }
        }
        
        // evitar estancarse
        if otro.x == x and otro.y == y
        {
            x += -1 + random(2);
            y += -1 + random(2);
        }
    }
}

// rebotar si colisiono
if otro != noone
{
    mov_ia = true;
    dir_ia = point_direction(otro.x, otro.y, x, y);
}
// acciones IA
else
{
    switch tipo
    {
        case m_ciudadano:
        case m_turista:
        case m_obrero:
            break;
        
        case m_brujo:
            otro = s_cercano(id, control.visual, neutral);
            if otro != noone
            {
                if otro.tipo == m_raro and !otro.cumplio
                {
                    mov_ia = true;
                    dir_ia = point_direction(x, y, otro.x, otro.y);
                    if collision_circle(x, y, 16, otro, true, false)
                    {
                        if random(1) > 0.5
                        {
                            otro.cumplio = true;
                        }
                        else
                        {
                            instance_create(x, y, personaje_a);
                            instance_destroy();
                            exit;
                        }
                    }
                }
            }
            break;
        
        case m_soldado:
        case m_defensa:
            otro = s_cercano(id, control.visual, peligroso);
            if otro != noone
            {
                mov_ia = true;
                dir_ia = point_direction(x, y, otro.x, otro.y);
            }
            break;
        
        case m_enemigo:
            otro = s_cercano(id, control.visual, aliado);
            if otro != noone
            {
                mov_ia = true;
                dir_ia = point_direction(x, y, otro.x, otro.y);
            }
            break;
        
        case m_donante:
            if cumplio
            {
                mov_ia = true;
                dir_ia = point_direction(room_width * 0.5, room_height * 0.5, x, y);
            }
            else
            {
                otro = s_cercano(id, control.visual * 3, industria);
                if otro != noone
                {
                    mov_ia = true;
                    dir_ia = point_direction(x, y, otro.x, otro.y);
                    if collision_circle(x, y, 16, otro, true, false)
                    {
                        cumplio = true;
                        control.monedas++;
                        audio_play_sound(a_monedas, 10, false);
                    }
                }
            }
            break;
        
        case m_ladron:
            if cumplio
            {
                mov_ia = true;
                dir_ia = point_direction(room_width * 0.5, room_height * 0.5, x, y);
            }
            else
            {
                otro = s_cercano(id, control.visual * 3, industria);
                if otro != noone
                {
                    mov_ia = true;
                    dir_ia = point_direction(x, y, otro.x, otro.y);
                    if collision_circle(x, y, 16, otro, true, false)
                    {
                        cumplio = true;
                    }
                }
            }
            break;
        
        case m_raro:
            if cumplio
            {
                mov_ia = true;
                dir_ia = point_direction(room_width * 0.5, room_height * 0.5, x, y);
            }
            else
            {
                otro = s_cercano(id, control.visual, aliado);
                if otro != noone
                {
                    if otro.tipo != m_brujo
                    {
                        mov_ia = true;
                        dir_ia = point_direction(x, y, otro.x, otro.y);
                        if collision_circle(x, y, 16, otro, true, false)
                        {
                            cumplio = true;
                            var aux = instance_create(otro.x, otro.y, personaje_n);
                            aux.tipo = tipo;
                            aux.cumplio = true;
                            with otro { instance_destroy(); }
                            audio_play_sound(a_convenciendolo, 3, false);
                        }
                    }
                }
            }
            break;
        
        case m_bomba:
            otro = s_cercano(id, control.visual * 3, bloque);
            if otro != noone
            {
                mov_ia = true;
                dir_ia = point_direction(x, y, otro.x, otro.y);
                if collision_circle(x, y, 16, otro, true, false)
                {
                    instance_create(otro.x, otro.y, escombro);
                    with otro { instance_destroy(); }
                    vida = 0;
                }
            }
            break;
        
        case m_animal:
            break;
    }
}

// moverse como tal
if mov_ia
{
    x += lengthdir_x(control.velcamina * delta_time, dir_ia);
    y += lengthdir_y(control.velcamina * delta_time, dir_ia);
}

// limitarse al mapa y profundidad de dibujado
var xx = x;
var yy = y;
x = clamp(x, 32, room_width - 32);
y = clamp(y, 64, room_height);
if xx != x or yy != y
{
    if cumplio
    {
        var dolar = 0;
        if tipo == m_ladron
        {
            dolar = control.monedas;
            control.monedas = max(0, control.monedas - 1);
            dolar -= control.monedas;
        }
        s_envio(m_volvio, dolar, "?", dequien);
        instance_destroy();
        exit;
    }
    else
    {
        dir_ia = point_direction(x, y, room_width * 0.5, room_height * 0.5);
    }
}
depth = -y;

// morirse
if vida <= 0
{
    var mt = instance_create(x, y, muerto);
    if cumplio and (tipo == m_donante or tipo == m_ladron)
    {
        mt.tipo = tipo + 7;
    }
    else
    {
        mt.tipo = tipo;
    }
    instance_destroy();
}
}
