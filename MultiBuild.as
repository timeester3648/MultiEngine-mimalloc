void main(MultiBuild::Workspace& workspace) {	
	auto project = workspace.create_project(".");
	auto properties = project.properties();

	project.name("mimalloc");
	properties.binary_object_kind(MultiBuild::BinaryObjectKind::eStaticLib);
	project.license("./LICENSE");

	project.include_own_required_includes(true);
	project.add_required_project_include({
		"include"
	});

	properties.files({
		"./include/**.h",
		
		"./src/alloc.c",
		"./src/alloc-aligned.c",
		"./src/alloc-posix.c",
		"./src/arena.c",
		"./src/bitmap.c",
		"./src/heap.c",
		"./src/init.c",
		"./src/libc.c",
		"./src/options.c",
		"./src/os.c",
		"./src/page.c",
		"./src/random.c",
		"./src/segment.c",
		"./src/segment-map.c",
		"./src/stats.c",
		"./src/prim/prim.c"
	});

	properties.defines({
		"MI_STATIC_LIB"
	});
}