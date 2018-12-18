import_device eagle_s20.db -package BG256
read_verilog test.v -top test
optimize_rtl
map_macro
map
write_verilog full_td.v
