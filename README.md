Beamer Template For RUC Stat
===
* 这个模板是在Beamer自带的主题上进行修改得到，整体风格与自带模板接近，只是根据自身的喜好与统计学院的风格修改了字体和配色。

* 在该模板的基础上修改内容，便可完成一个还算美观的Slides.

| TeXLive Environment                                                  | Status             |
| -------------------------------------------------------------------- | ------------------ |
| ![TeXLive2019](https://img.shields.io/badge/TeXLive-2019-3D6117.svg) | :heavy_check_mark: |
### 使用说明

1. 配置好TeX环境，并安装好所需的字体
2. 直接对`main.tex`进行修改，填补Slides中的内容
3. 如有必要，可以对`mybeamer.cls`中内容进行修改，调整内容的格式
4. 编译修改好的`main.tex`文件，建议使用`xelatex`进行编译

### 一些注意事项

* **字体问题**
    * 本模板出于美观考虑，在一般Windows自带的字体以外，主要使用了[思源宋体](https://github.com/adobe-fonts/source-han-serif)以及[思源黑体](https://github.com/adobe-fonts/source-han-sans)。
    * 主要在标题类的部分使用加粗的宋体，正文部分主要使用黑体
<<<<<<< HEAD
    * 可在`\documentclass`处使用`noSy`选项以避免使用思源字体
=======
>>>>>>> 4d54ef73578d1a353391e7b71d0c2032913bde57

* **屏幕比例问题**

    * 通过调整documentclass的参数调整beamer的屏幕比例
    * 建议使用16:9，因为目前LOGO的位置只在16:9比例下进行了调整
    * 若要使用其他比例建议手动调整一下LOGO的位置
    * 会在接下来调整LOGO的位置以适应不同的画面比例

* **其他模板的使用问题**

    * <font color='dd0000'>若各位在模板的使用中有什么问题或是对模板本身有什么建议欢迎向我提出。</font>

### 更新

#### v1.002
* 增加了noSy选项，使用默认的中文字体而不是思源字体

**未完...**
