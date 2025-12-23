#stormworks-simple-ui-lib

A lightweight swLua library for creating complex UI elements.

## Features
Adds functionality missing from the vanilla screen library:
- simple buttons
- text buttons
- labels

## Installation
There are two ways to use the library:

### Option 1: Full version
Copy the full code from `src/full_simpleui.lua` and paste it into your IDE.

### Option 2: Partial integration
If you already have existing code and want to integrate the library manually,
copy the following sections separately:

- `-- lib` → paste at the beginning of your code
- `-- onTick` → paste into your `onTick` function (recommended at the beginning)
- `-- onDraw` → paste into your `onDraw` function (recommended at the beginning)

The same applies to the minified version.

## Usage
To create a UI element, use one of the following functions:

1. `sui.tglbutton(x, y, width, height, [outputIndex])`  
   → creates a toggle button

2. `sui.pshbutton(x, y, width, height, [outputIndex])`  
   → creates a push button

3. `sui.txttglbutton(x, y, width, height, text, [outputIndex])`  
   → creates a toggle button with text

4. `sui.txtpshbutton(x, y, width, height, text, [outputIndex])`  
   → creates a push button with text

5. `sui.label(x, y, width, height, text)`  
   → creates a label

[] indicates an optional parameter.

⚠️ **Important:**  
All UI creation functions must be called **between the `-- lib` section and the `onTick` function**.  
Do **not** call them inside `onTick` or `onDraw`.

## License

MIT License