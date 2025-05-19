// arg0: tipo de mensaje
// arg1: valor del mensaje
// arg2: texto nombre de quien envia
// arg3: texto nombre de a donde enviarlo

var buf = buffer_create(3, buffer_grow, 1);
buffer_seek(buf, buffer_seek_start, 0);
buffer_write(buf, buffer_u8, argument0);
buffer_write(buf, buffer_u8, argument1);
buffer_write(buf, buffer_string, argument2);
buffer_write(buf, buffer_string, argument3);

var broadcast = false;
if argument0 == m_expulsado or argument0 == m_activo
    { broadcast = true; }

if control.master
{
    for (var u = 0; u < control.usuarios; u++)
    {
        if control.apodos[u] == argument3 or broadcast
        {
            network_send_packet(control.conectados[u], buf, buffer_tell(buf));
        }
    }
}
else
{
    network_send_packet(control.socket, buf, buffer_tell(buf));
}

buffer_delete(buf);    
