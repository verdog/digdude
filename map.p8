-- level map
-- uses memory reserved for map data!

-- level is made of 8 blocks of 128x128 pixel (16x16 block) chunks.
-- the chunks are arranged in a 2x8 grid.
-- this means the entire map size is 32x128 blocks or 256x1024 pixels.

_blocks = {
 air = 0,
 dirt = 1,
 rock = 2
}

_block_sprites = {
 64, -- air
 65, -- dirt
 66  -- rock
}

function map_clear()
 memset(0x2000, 1, 0x1000)
end

function map_getblock(x, y)
 return peek(0x2000 + y*32 + x)
end

function map_setblock(x, y, block)
 return poke(0x2000 + y*32 + x, block)
end

function map_fill(x, y, w, h, block)
 -- might need to speed this up?
 for j=0,h-1 do
  for i=0,w-1 do
   map_setblock(x+i,y+j,block)
  end
 end
end

function map_generate()
 map_clear()

 -- initial air pocket
 map_fill(0,0,32,8,_blocks.air)

 -- random rocks
 map_fill(
  0+flr(rnd()*32),
  8+flr(rnd()*32),
  flr(rnd()*7),
  flr(rnd()*7),
  _blocks.rock
 )

 -- rooms
 map_fill(0,32,32,14,_blocks.air)
 map_fill(0,60,32,14,_blocks.air)
 map_fill(0,98,32,14,_blocks.air)
 map_fill(0,119,32,8,_blocks.air) -- final room
end

function map_draw()
 printf(cam:str())

 -- borders
 color(4)
 line(0, 0, 255, 0)
 line(255, 1023)
 line(0, 1023)
 line(0, 0)

 -- blocks
 for y=flr(cam.y/8),ceil(cam.y/8+16) do
  for x=flr(cam.x/8),ceil(cam.x/8+16) do
   -- print(_block_sprites[map_getblock(x,y)+1], x*8, y*8)
   spr(_block_sprites[map_getblock(x,y)+1],x*8,y*8,1,1)
  end
 end
end