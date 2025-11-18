---@diagnostic disable: unused-local, undefined-global

-- 代码片段

return {
	"L3MON4D3/LuaSnip",
		version = "*",
		build = "make install_jsregexp",
		config  = function(_,opts)

		local ls = require "luasnip"
		local extras = require "luasnip.extras"

		ls.setup({
			snip_env ={

			-- 添加片段
			-- `ls.add_snippets(filetype,snippets)`,filetype为`"all"`为全局访问

			-- 前缀片段`s(trigger:string,nodes:table)`,简化不考虑opts
			s = require("luasnip.nodes.snippet").S,

			-- 片段节点`sn(pos:number,nodes:table)`
			sn = require("luasnip.nodes.snippet").SN,

			-- 对齐片段节点`isn(pos:number,nodes:table,opts:string)`
			-- opts用来控制换行后插入前面的文本,`$PARENT_INDENT`表示父缩进
			isn = require("luasnip.nodes.snippet").ISN,

			-- 文本节点`t(text:string|table)`,用table表示换行`t({"",""})`
			t = require("luasnip.nodes.textNode").T,

			-- 插入节点`i(position:number,default_text:string|table)`,`i(0)`为退出节点
			i = require("luasnip.nodes.insertNode").I,

			-- 函数节点`f(fn:function,args:table|number)`,简化不考虑opts
			-- `fn(fn_args:table,snip:table,user_args*) ->string|string_table`
			---- `fn_args`为节点二维表,[n][m]表示位置n的第m行内容
			---- `snip`为函数父节点,`.captures jsregex捕获`,`.env环境`,...
			-- `args`为监听节点索引
			f = require("luasnip.nodes.functionNode").F,

			--选择节点`c(pos:number,choices:table)`,简化不考虑opts
			--choices为包含节点的表
			c = require("luasnip.nodes.choiceNode").C,

			-- 动态节点`d(pos:int,func:function,deps_nodes:number|table)`
			----`func(args,parent,old_state,user_args...)->snippetnode`
			----`deps_nodes`为依赖的节点
			d = require("luasnip.nodes.dynamicNode").D,

			--存储节点`r(pos:int,key:string,nodes:table)`
			r = require("luasnip.nodes.restoreNode").R,

			events = require("luasnip.util.events"),
			k = require("luasnip.nodes.key_indexer").new_key,

			--绝对索引表
			ai = require("luasnip.nodes.absolute_indexer"),

			extras = require("luasnip.extras"),

			-- 重复节点`rep(pos:int)`
			rep = require("luasnip.extras").rep,

			p = require("luasnip.extras").partial,
			m = require("luasnip.extras").match,
			l = require("luasnip.extras").lambda,

			-- 后缀片段`postfix(trigger:string,nodes:table)`
			postfix = require("luasnip.extras.postfix").postfix,

			-- 格式化节点`fmt(fmt:string,nodes:table)`,简化不考虑opts
			-- `fmt`中`{name}`表示name的节点,可以在nodes中指定name
			-- `fmt`转义：`{{`,`}}`
			-- nodes中指定节点,默认类似位置参数,也可以类似关键字参数
			fmt = require("luasnip.extras.fmt").fmt,

			fmta = require("luasnip.extras.fmt").fmta,

			n = require("luasnip.extras").nonempty,
			dl = require("luasnip.extras").dynamic_lambda,
			conds = require("luasnip.extras.expand_conditions"),

			types = require("luasnip.util.types"),
			parse = require("luasnip.util.parser").parse_snippet,
			ms = require("luasnip.nodes.multiSnippet").new_multisnippet

			}
		})

	require("luasnip.loaders.from_lua").load()
		--
		-- Equivalent to:
		--`require("luasnip.loaders.from_lua").load({`
				--` paths = vim.fn.stdpath("config") .. "/luasnippets"})`

		end,

		lazy = true
}


























