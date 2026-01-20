---@diagnostic disable: undefined-global

return
-- Regular snippets
{

	s("bitree", fmt([[
	typdef struct {bitree} {{

		{members}

		struct {bitree_rep} left;
		struct {bitree_rep} right;
	}}{bitree_rep};

	{tree_end}

	]], {
		bitree = i(1,"bitree"),
		members = i(2,"MEMBERS"),
		bitree_rep = rep(1),
		tree_end = i(0)
	}))

},

-- Auto snippets
{}


