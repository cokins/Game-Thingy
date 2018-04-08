tool
extends Node

export(bool) var RUN = false setget onReset
export(int) var TILE_SIZE = 16
export(Texture) var ATLAS_FILE

func _ready():
    pass

func onReset(isTriggered):
    if (isTriggered):
        reset = false
        var w = ATLAS_FILE.get_width() / TILE_SIZE
        var h = ATLAS_FILE.get_height() / TILE_SIZE

        for y in range(h):
            for x in range(w):
                var tile = Sprite.new()
                add_child(tile)
                tile.set_owner(self)
                tile.set_name(str(x+y*w))
                tile.set_texture(ATLAS_FILE)
                tile.set_region(true)
                tile.set_region_rect(Rect2(x*TILE_SIZE, y*TILE_SIZE, TILE_SIZE, TILE_SIZE))
                tile.position = Vector2(x*TILE_SIZE+TILE_SIZE/2, y*TILE_SIZE+TILE_SIZE/2)