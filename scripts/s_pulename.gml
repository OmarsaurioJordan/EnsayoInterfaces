// arg0: texto que indica el nombre sin pulir
// ret: texto con el nombre verificado

var txt = argument0;

txt = string_replace_all(txt, " ", "");
txt = string_lettersdigits(txt);
txt = string_copy(txt, 1, min(10, string_length(txt)));

return txt;
