ini_open("save.ini");
{
    control.monedas = real(ini_read_string("data", "monedas", "0"));
    control.historia = real(ini_read_string("data", "historia", "0"));
    control.estado = real(ini_read_string("data", "estado", string(m_bonusiando)));
    control.ciclo = real(ini_read_string("data", "ciclo", "0"));
    control.nombre = ini_read_string("data", "nombre", "");
    control.enmira = ini_read_string("data", "enmira", "");
    control.remote_ip[0] = ini_read_string("data", "server", "0.0.0.0");
    control.m_puerto = real(ini_read_string("data", "puerto_global", "3456"));
    
    var i = 0;
    while ini_key_exists("casa", "x" + string(i))
    {
        instance_create(real(ini_read_string("casa", "x" + string(i), "0")),
            real(ini_read_string("casa", "y" + string(i), "0")), casa);
        i++;
    }
    
    var i = 0;
    while ini_key_exists("industria", "x" + string(i))
    {
        instance_create(real(ini_read_string("industria", "x" + string(i), "0")),
            real(ini_read_string("industria", "y" + string(i), "0")), industria);
        i++;
    }
    
    var i = 0;
    while ini_key_exists("templo", "x" + string(i))
    {
        instance_create(real(ini_read_string("templo", "x" + string(i), "0")),
            real(ini_read_string("templo", "y" + string(i), "0")), templo);
        i++;
    }
    
    var i = 0;
    while ini_key_exists("cuartel", "x" + string(i))
    {
        instance_create(real(ini_read_string("cuartel", "x" + string(i), "0")),
            real(ini_read_string("cuartel", "y" + string(i), "0")), cuartel);
        i++;
    }
    
    var aux;
    var i = 0;
    while ini_key_exists("personaje_a", "x" + string(i))
    {
        aux = instance_create(real(ini_read_string("personaje_a", "x" + string(i), "0")),
            real(ini_read_string("personaje_a", "y" + string(i), "0")), personaje_a);
        aux.tipo = real(ini_read_string("personaje_a", "t" + string(i), "0"));
        i++;
    }
    
    var aux;
    var i = 0;
    while ini_key_exists("personaje_n", "x" + string(i))
    {
        aux = instance_create(real(ini_read_string("personaje_n", "x" + string(i), "0")),
            real(ini_read_string("personaje_n", "y" + string(i), "0")), personaje_n);
        aux.tipo = real(ini_read_string("personaje_n", "t" + string(i), "0"));
        i++;
    }
    
    var aux;
    var i = 0;
    while ini_key_exists("personaje_p", "x" + string(i))
    {
        aux = instance_create(real(ini_read_string("personaje_p", "x" + string(i), "0")),
            real(ini_read_string("personaje_p", "y" + string(i), "0")), personaje_p);
        aux.tipo = real(ini_read_string("personaje_p", "t" + string(i), "0"));
        i++;
    }
}
ini_close();
