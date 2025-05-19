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
for (var u = 0; u < control.usuarios; u++)
{
    network_send_udp(control.socket, control.remote_ip[u],
        control.remote_port[u], buf, buffer_tell(buf));
}
buffer_delete(buf);
