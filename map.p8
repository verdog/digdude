-- level map
-- uses memory reserved for map data!

-- dependencies:
--  camera.p8

-- level is made of 8 blocks of 256x256 pixel (16x16 block) chunks.
-- the chunks are arranged in a 2x8 grid.
-- this means the entire map size is 512x2048.

_blocks = {
 air = 0,
 dirt = 1
}

_block_sprites = {
 0, -- air
 64 -- dirt
}

function map_clear()
 memset(0x2000, 0, 0x1000)
end

function map_getblock(x, y)
 return peek(0x2000 + y*512 + x)
end

function map_setblock(x, y, block)
 return poke(0x2000 + y*512 + x, block)
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
 map_fill(0,10,16,8,_blocks.dirt)
end

function map_draw()
 for y=0,15 do
  for x=0,15 do
   -- print(_block_sprites[map_getblock(x,y)+1], x*8, y*8)
   spr(_block_sprites[map_getblock(x,y)+1],x*8,y*8)
  end
 end
end