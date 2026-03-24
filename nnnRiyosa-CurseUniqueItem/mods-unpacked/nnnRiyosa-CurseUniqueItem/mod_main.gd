extends Node

const MOD_DIR := "nnnRiyosa-CurseUniqueItem/"
const MOD_LOG = "nnnRiyosa-CurseUniqueItem"

var mod_dir_path := ""
var extensions_dir_path := ""
var translations_dir_path := ""

func _init() -> void:
	mod_dir_path = ModLoaderMod.get_unpacked_dir().plus_file(MOD_DIR)
	# Add extensions
	install_script_extensions()
	# Add translations
	add_translations()

func install_script_extensions() -> void:
	extensions_dir_path = mod_dir_path.plus_file("extensions")
	ModLoaderMod.install_script_extension(extensions_dir_path.plus_file("ui/menus/shop/base_shop.gd"))
	ModLoaderMod.install_script_extension(extensions_dir_path.plus_file("singletons/item_service.gd"))


func add_translations() -> void:
	translations_dir_path = mod_dir_path.plus_file("translations")
		# ModLoaderMod.add_translation(translations_dir_path.plus_file(...))

func _ready() -> void:
	ModLoaderLog.info("CurseUniqueItem Mod Ready!", MOD_LOG)
