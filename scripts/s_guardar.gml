ini_open("save.ini");
{
    ini_write_string("data", "monedas", string(control.monedas));
    ini_write_string("data", "historia", string(control.historia));
    ini_write_string("data", "estado", string(control.estado));
    ini_write_string("data", "ciclo", string(control.ciclo));
    ini_write_string("data", "nombre", control.nombre);
    if !control.master
    {
        ini_write_string("data", "server", control.remote_ip[0]);
    }
    ini_write_string("data", "enmira", control.enmira);
    ini_write_string("data", "puerto_global", string(control.m_puerto));
    
    var i = 0;
    with casa
    {
        ini_write_string("casa", "x" + string(i), string(x));
        ini_write_string("casa", "y" + string(i), string(y));
        i++;
    }
    
    var i = 0;
    with industria
    {
        ini_write_string("industria", "x" + string(i), string(x));
        ini_write_string("industria", "y" + string(i), string(y));
        i++;
    }
    
    var i = 0;
    with templo
    {
        ini_write_string("templo", "x" + string(i), string(x));
        ini_write_string("templo", "y" + string(i), string(y));
        i++;
    }
    
    var i = 0;
    with cuartel
    {
        ini_write_string("cuartel", "x" + string(i), string(x));
        ini_write_string("cuartel", "y" + string(i), string(y));
        i++;
    }
    
    var i = 0;
    with personaje_a
    {
        ini_write_string("personaje_a", "x" + string(i), string(x));
        ini_write_string("personaje_a", "y" + string(i), string(y));
        ini_write_string("personaje_a", "t" + string(i), string(tipo));
        i++;
    }
    
    var i = 0;
    with personaje_n
    {
        ini_write_string("personaje_n", "x" + string(i), string(x));
        ini_write_string("personaje_n", "y" + string(i), string(y));
        ini_write_string("personaje_n", "t" + string(i), string(tipo));
        i++;
    }
    
    var i = 0;
    with personaje_p
    {
        ini_write_string("personaje_p", "x" + string(i), string(x));
        ini_write_string("personaje_p", "y" + string(i), string(y));
        ini_write_string("personaje_p", "t" + string(i), string(tipo));
        i++;
    }
}
ini_close();
