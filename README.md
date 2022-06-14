# Material_Select

Material select design in OpenHarmony.

## Download & Install



## Usage Instructions

Material select library provides three types of select boxes:- <br/><br/>
MaterialSelect - Provides single option selection functionality. <br/><br/>
MultipleSelect - Provides multiple option selection functionality. <br/><br/>
DotMenu - Provides dot menu functionality. <br/>

1. Import files and code dependencies

```ets
import { MaterialSelect, MenuOption, MultipleMaterialSelect, MultipleMenuOption, MaterialDotMenu, DotMenuOption, MaterialModel } from '../commom/select'
```

2. Initialize select model data

```
private singleSelectModel: MaterialModel.Model = new MaterialModel.Model("Title", "Placeholder")

private multipleSelectModel: MaterialModel.Model = new MaterialModel.Model("Title")

private dotModel: MaterialModel.DotModel = new MaterialModel.DotModel()
```

3. Initialize select menu model data

```
private singleSelectMenuModel: MaterialModel.MenuModel = new MaterialModel.MenuModel()

private multipleSelectMenuModel: MaterialModel.MultipleMenuModel = new MaterialModel.MultipleModel()

private dotMenuModel: MaterialModel.DotMenuModel = new MaterialModel.DotMenuModel()
```

4. Initialize menus for select components

```
private single: MenuOption[] = [
    new MenuOption("Option 1", 1),
    new MenuOption("Option 2", "2")
]

private multiple: MultipleMenuOption[] = [
    new MultipleMenuOption("Option 1", 1),
    new MultipleMenuOption("Option 2", "2", true)
]

private dot: DotMenuOption[] = [
    new DotMenuOption("Preview", 1),
    new DotMenuOption("Download", "2", $r("app.media.download")
]
```

5. Code for creating single selection component

```
MaterialSelect({
    menu: this.single,
    onSelect: (it: MenuOption) => {},
    model: this.singleSelectModel
})
```

![Component](screenshots/single_select_box.png)
![Menu](screenshots/single_select_box_with_menu.png)
![Selection](screenshots/single_select_box_selected.png)

6. Code for creating multiple selection component

```
MultipleMaterialSelect({
    menu: this.multiple,
    onSelect: (it: MultipleMenuOption[]) => {},
    model: this.multipleSelectModel,
    menuModel: this.singleSelectMenuModel
})
```

![Component](screenshots/multiple_select_box.png)
![Component](screenshots/multiple_select_box_with_menu.png)

6. Code for creating dot menu component

```
MaterialDotMenu({
      menu: this.dotMenu,
      onSelect: (it: DotMenuOption) => {},
      model: this.dotModel,
      menuModel: this.dotMenuModel
})
```

![Component](screenshots/dot_menu_box.png)
![Component](screenshots/dot_menu_box_with_menu.png)

## Compatibility

Supports OpenHarmony API version 8

## Code Contribution



## Open source License



# Reference:

Design by : Sarthak Gothalyan