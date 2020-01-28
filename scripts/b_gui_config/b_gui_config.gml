/// @func b_gui_config()
enum B_EGuiShape
{
	Alert,
	Blank,
	Canvas,
	Container,
	ContextMenu,
	ContextMenuItem,
	Dock,
	MenuBar,
	MenuBarItem,
	Panel,
	Question,
	Scrollbar,
	Set,
	Toolbar,
	ToolbarButton,
	ToolbarSwitch,
	Viewport,
	Window,
	SIZE
};

enum B_EGuiSplit
{
	Horizontal,
	Vertical,
};

enum B_EGuiResize
{
	None = $0000,
	Left = $1000,
	Top = $0100,
	Right = $0010,
	Bottom = $0001,
	Horizontal = $1010,
	Vertical = $0101,
};

enum B_EGuiColor
{
	Background = $1E1E1E,
	Text = $FFFFFF,
	TextSelected = $FFFFFF,
	Input = $252525,
	Section = $2D2D2D,
	WindowBackground = $2D2D2D,
	WindowBackground2 = $333333,
	WindowBorder = $3F3F3F,
	WindowButton = $686868,
	Scrollbar = $9E9E9E,
	Highlight = $686868,
	Active = $A56428,
	ActiveLight = $A96D3F,
	Disabled = c_gray,
	Shadow = c_black,
	ShadowAlpha = 1,
};