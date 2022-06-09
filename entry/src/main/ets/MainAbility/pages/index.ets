// make index ui
// 100 % width for file container
// material file to dot menu
// use list
// remove scroller
// camel case variables
// give max 2 line support
// remove item width
// text color
// border width
// background color
// aboutToAppear works before rendering

import {
    Select,
    MenuOption,
    MultipleSelect,
    MultipleMenuOption,
    MultipleMenuSelection,
    DotMenu
} from '../common/select'

@Entry
@Component
struct Index {
    @State message: string = 'Hello World'
    @State select_menu: MenuOption[] = []
    @State selection: MenuOption = {value: "", id: -1}
    multiple_select_menu: MultipleMenuOption[] = []
    @State multiple_selection: MultipleMenuSelection[] = []
    desc: string = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam et pellentesque nisl. Nulla accumsan at leo vel finibus. Pellentesque dictum tempus tortor nec tempus. Proin tincidunt augue eros, eu tincidunt orci tempus posuere. Etiam suscipit ligula nec lacus maximus pellentesque. Aliquam blandit tincidunt justo, ac rhoncus nunc suscipit id. Duis sodales malesuada orci, id bibendum mauris ultricies eu. Etiam congue volutpat metus, eu volutpat tortor accumsan vitae. Nam blandit, turpis ut bibendum fermentum, ex arcu ultrices mi, suscipit dignissim ante mi vel purus. Nunc magna ipsum, sollicitudin et erat et, placerat finibus lorem. Integer nisl elit, interdum non maximus nec, luctus ut ligula. Vestibulum facilisis lorem varius, suscipit urna eget, convallis velit. Maecenas consectetur in arcu sit amet malesuada. Etiam gravida velit non accumsan finibus. Ut id lacus ultrices, lacinia quam ac, dapibus enim. Etiam sed velit vulputate, pellentesque urna et, sodales tortor."

    aboutToAppear() {
        for(let i = 0; i <= 10; i++) {
            this.select_menu.push({
                value: 'Option ' + i,
                id: i
            })
        }
        let options = [true, false, true, false, true, true]
        options.forEach((c, i) => {
            this.multiple_select_menu.push({
                value: 'Option ' + i,
                id: i,
                is_checked: c
            })
        })
    }

    build() {
        Column({space: 10}) {
            Flex({justifyContent: FlexAlign.SpaceBetween, alignItems: ItemAlign.Center}) {
                Image($r('app.media.back')).height(24).width(24).objectFit(ImageFit.Contain)
                Text('Select Menus').fontSize(21).fontWeight(FontWeight.Bold)
                Image($r('app.media.categories')).height(24).width(24).objectFit(ImageFit.Contain)
            }
              .width('80%')
            Row() {
//                Select({
//                    menu: this.select_menu,
//                    select: (it: MenuOption) => {
//                        console.log(it.value)
//                    },
//                    background_color: Color.Pink
//                })
//                MultipleSelect({
//                    menu: this.multiple_select_menu,
//                    select: (itL: MultipleMenuSelection[]) => {
//                        itL.forEach((it) => {
//                            console.log(it.value)
//                        })
//                    },
//                    background_color: Color.Pink
//                })
            }
            DotMenu({text: this.desc})
            Button("Test").onClick(() => {
                console.log("Select: " + this.selection.value + ", " + this.selection.id)
                this.multiple_selection.forEach((it) => {
                    console.log("Multiple Select: " + it.value + ", " + it.id)
                })
            })
        }
            .width('100%')
            .margin({left: 10, right: 10, top: 10, bottom: 10})
    }
}