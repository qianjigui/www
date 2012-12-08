---
layout: default
category: it/study/dcu
title: "EE563GraphicsAndVisualisation"
---

#EE563GraphicsAndVisualisation#
##Java2D##
*  Functions
  *  Interpretation 解释(输入)
    *  Image file format图像文件的数据结构
      *  Header 头信息
        *  大小(pixels)
          *  Width长
          *  Height高
        *  Compression scheme 压缩方案
        *  Colour Palette调色板(图像颜色信息的编码索引)
        *  resolution 分辨率
      *  Data 图像数据信息
  *  Manipulation 操作(编辑)
  *  Display 显示(输出)
*  JDK
  *  SWT
    *  Graphics
      *  void setColor(Color c) 
      *  void drawOval(int x, int y, int width, int height) 
      *  void drawRect(int x, int y, int width, int height) 
      *  void drawString(String str, int x, int y) 
      *  boolean drawImage(Image img, int x, int y, ImageObserver obs) 
    *  Image
      *  int getWidth(ImageObserver observer) 
      *  int getHeight(ImageObserver observer) 
      *  Graphics getGraphics() 
      *  Toolkit.getDefaultToolkit().createImage(”image.jpg”); 
    *  Processing
      *  MemoryImageSource data = new MemoryImageSource(width, height, pixels,0,width);
      *   i = Toolkit.getDefaultToolkit (). createImage(data);
    *  Defining Colours
      *  Color(float r, float g, float b, float a) 
      *  Color(int r, int g, int b, int a) 
      *  a:alpha 透明度,数值越大越不透明
  *  2D
    *  Graphics
      *  Control
        *  Geometry 各种几何图形
        *  Coordinate transformations 图形转换
        *  Colour management 颜色管理
        *  Text layout 文字层
      *  anti-aliasing feature 像素模糊化
        *  setRenderingHint(key,value)
        *  key
          *  RenderingHints.KEY_ANTIALIASING
        *  value
          *  RenderingHints.VALUE_ANTIALIAS_ON
          *  RenderingHints.VALUE_ANTIALIAS_OFF
          *  RenderingHints.VALUE_ANTIALIAS_DEFAULT
      *  BufferedImage
        *  void setRenderingHint(RenderingHints.Key key, Object value) 
        *  void scale(double sx, double sy) 
        *  void rotate(double theta) 
        *  void translate(double tx, double ty) 
    *  Image
      *  BufferedImage(int width, int height, int imageType) 
        *  Type
          *  TYPE BYTE BINARY 
          *  TYPE INT ARGB
          *  TYPE INT RGB
      *  Process
        *  int getRGB(int x, int y) 
        *  void setRGB(int x, int y, int rgb) 
        *  BufferedImage getSubImage(int x, int y, int w, int h) 
      *  2D Transformations
        *  Method
          *  http://qjg-wiki.googlecode.com/files/EE563Java2DTransformationsMethod.jpg
        *  Scale 比例缩放
          *  http://qjg-wiki.googlecode.com/files/EE563Java2DTransformationsScale.jpg
        *  Translate 移动
          *  http://qjg-wiki.googlecode.com/files/EE563Java2DTransformationsTranslate.jpg
        *  Rotate 旋转
          *  http://qjg-wiki.googlecode.com/files/EE563Java2DTransformationsRotate.jpg
  *  Advanced(JAI)
##VRML(Virtual Reality Markup Language )##
*  Coordinate System
  *  Every point in a VRML world can be described by a set of x, y and z coordinates.
  *  http://qjg-wiki.googlecode.com/files/vrmlcoordinatesystem.gif
*  Scene Graphs
  *  node节点
  *  arc关系
    *  DAG 树形无回路图
*  Shape
  *  Geometry
  *  Appearance
*  Transformations
*  Texture Mapping
*  Creating Custom Geomtery
  *  凸立方体(不能有凹面)
  *  同一个平面的点必须共面
##Java3D##
*  the scene graph programming model 场景图像编程模型
  *  What to draw
*  Data Type 数据类型
  *  import javax.vecmath 
  *  Type
    *  Point
      *  Point2d
        *  A 2 element point that is represented by double precision floating point x,y coordinates
    *  Vector
    *  Colour
      *  Color3b(byte r, byte g, byte b) 
        *  不透明
          *  a=255
      *  Color3f
        *  a=1.0不透明
      *  Color4f(float r, float g, float b, float a)
        *  r,g,b,a in [0.0,1.0]
      *  RGB model 加色法混色模型
        *  0xRRGGBB
        *  8bits 表示 [0,255]
  *  Dimension 维度
    *  2D
      *  Text
    *  3D
      *  RGB
    *  4D
      *  3D vector + rotation 模型+旋转
  *  Precision 精度
    *  byte
    *  integer
    *  float
    *  double
*  Scene Graphs场景图像
  *  DAG
  *  SceneGraphObject场景图像对象
    *  Node
      *  Group
        *  BranchGroup根
          *  Root
          *  void addBranchGraph(BranchGroup branchGroup) 
          *  void removeBranchGraph(BranchGroup branchGroup)
        *  OrderedGroup有序集合
          *  void addChild(Node child) 
          *  void addChild(Node child, int[] childIndexOrder) 
          *  int[] getChildIndexOrder()
        *  TransformGroup可翻转等具有变化特性的集合
          *  TransformGroup() 
          *  TransformGroup(Transform3D transform)
          *  void setTransform(Transform3D transform)
          *  void getTransform(Transform3D transform)
        *  Switch开关集合
          *  Constructor
            *  Switch() 
            *  Switch(int whichChild) 
            *  Switch(int whichChild, BitSet childMask) 
          *  Setter/Getter
            *  int getWhichChild() 
            *  void setWhichChild(int childSelectionValue)
            *  BitSet getChildMask() 
            *  void setChildMask(BitSet childMask) 
          *  Capability
            *  ALLOW_SWITCH_READ 
            *  ALLOW_SWITCH_Write
        *  SharedGroup共享集合
          *  Subgroup
            *  Light
            *  Link
            *  Morph
            *  Shape
            *  Sound
        *  ViewSpecificGroup
      *  Leaf
        *  Shape3D
          *  Constructor
            *  Shape3D() 
            *  Shape3D(Geometry geometry, Appearance appearance) 
            *  It contains a list of one or more Geometry component objects and a single Appearance component object. The geometry objects define the shape node's geometric data. The appearance object specifies that object's appearance attributes, including color, material, texture, and so on. 
          *  Getter/Setter
            *  void addGeometry(Geometry geometry) 
            *  Geometry getGeometry(int index) 
            *  void setAppearance(Appearance appearance) 
            *  Appearance getAppearance() 
          *  Primitives 
            *  Box
            *  Cone
            *  Cylinder
            *  Sphere
        *  ViewPlatform
        *  Environmental
          *  Background
            *  Background(Color3f backgroundColour) 
            *  Background(ImageComponent2D backgroundImage) 
          *  Behaviour
            *  void setSchedulingBounds(Bounds region) 
            *  Mouse
            *  Picking
          *  Clip
          *  Fog
            *  LinearFog 
              *  Colour
              *  Front distance
              *  Back distance
              *  LinearFog(Color3f colour, double frontDistance, double backDistance) 
              *  物体距离与烟雾整体效果相除，查看影响因子，然后做颜色叠加
            *  ExponentialFog 
          *  Lighting
            *  DirectionalLight 
            *  PointLight 
            *  SpotLight 
              *  a point light source that shines in a specific direction 
            *  AmbientLight 漫反射光源
            *  环境光效果计算http://hi.baidu.com/fcl06/blog/item/ad858e163246fb59f2de3207.html/cmtid/ceaa4a826b25faac0df4d25b
          *  Sound
          *  BoundingSphere(效果范围球)
            *  new BoundingSphere(new Point3d(), Double.MAX_VALUE)
            *  给出作用点和作用半径，这样就可以影响一定能范围的物体
          *  BoundingBox(Point3d lower, Point3d upper)  
    *  NodeComponent
      *  Geometry
        *  Raster (2D image)
        *  GeometryArray 
        *  CompressedGeometry 
        *  Defining polygons
          *  The order of the vertices is important when defining the orientation of the polygon.
          *  Vertices of a quad must form a convex, planar polygon
        *  Text3D
          *  font
          *  string
          *  path
          *  position
          *  alignment
          *  character spacing
      *  Appearance
        *  Material
          *  defines the appearance of an object under illumination, such as the ambient colour, diffuse colour, specular colour, emissive colour, and shininess. 
          *  Ambient 反射环境光 
          *  Diffuse 漫反射 
          *  Specular 镜面反射 
          *  Emissive 自身发出什么光 
          *  Shininess 有光泽 
        *  Texture
          *  defines the texture image and filtering parameters used when tex- ture mapping is enabled. 
          *  贴图纹理
            *  texture coordinates 
              *  http://blog.csdn.net/doing5552/archive/2008/04/22/2315425.aspx
          *  Two modes
            *  CLAMP 强制拉伸
              *  force
            *  WRAP 循环
              *  repeat
        *  TexCoordGeneration 
          *  defines the attributes that apply to tex- ture coordinate generation, such as whether coordinate generation is enabled, coordinate format (2D or 3D coordinates), coordinate generation mode (object linear, eye linear, or spherical reflection mapping), and the R, S and T coordi- nate plane equations. 
        *  TextureUnitState 
          *  an array that defines the texture state for each of N separate texture units. This allows multiple textures to be applied to a geometry. 
          *  Each TextureUnitState object contains a Texture object, a TextureAttributes object and a TexCoordGeneration object. 
        *  Attribute
          *  LineAttributes
            *  pattern
            *  width
            *  antialiasing抗锯齿
          *  PointAttributes
            *  point
            *  size
            *  antialiasing
          *  PolygonAttributes
            *  defines the attributes used to render polygons, in- cluding culling, rasterization mode (filled, lines, or points), constant offset, offset factor and whether back facing normals are flipped. 
          *  RenderingAttributes
            *  defines rendering operations, including the alpha test function and test value, the raster operation, whether vertex colours are ignored, whether invisible objects are rendered, and whether the depth buffer is enabled. 
          *  TransparencyAttributes
            *  defines the attributes that affect transparency mode (blended, screen-door), blending function (used in transparency and antialiasing operations), and a blend value that defines the amount of trans- parency to be applied. 
            *  SCREEN_DOOR模式通过选择某些像素完全透明而其他完全不透明实现。完全透明的像素所占比例与指定的透明参数几近相等。BLENDED模式透明度则通过将所有像素以指定透明参数百分数透明化。（BLENDED transparency is achieved by having all pixels be paririally transparent int the percentage specified by the transparency parameter.）混合方程由srcBlendFunction和dstBlendFunction属性指定。
              *  The SCREEN_DOOR mode creates gaps in the foreground colour to simulate different levels of transparency. The BLENDED mode blends the foreground and background colours to generate a more accurate and visually appealing result. 
            *  http://hi.baidu.com/straybirdsnest/blog/item/a02225429c0068046a63e57f.html
          *  ColoringAttributes
            *  Color selection
            *  Shading底纹
          *  TextureAttributes
            *  defines the attributes that apply to texture mapping, such as the texture mode, texture transform, blend colour, and perspective correction mode 
  *  VirtualUniverse, Locale and SimpleUniverse
*  PickTool
  *  PickCanvas
    *  A tolerance of 0.0 may speedup picking slightly, but also make it very difficult to pick points and lines.
*  Behaviour
  *  DistanceLOD
  *  MouseZoom
  *  Billboard
  *  PositionInterpolator 
*  System Architecture
  *  Threads
    *  System
      *  Reference Handler
      *  Finalizer
      *  Signal Dispatcher
    *  Main
      *  Main
      *  AWT-EventQueue0
      *  SunToolkit.PostEventQueue-0
      *  AWT-Windows
      *  Image Fetcher 1
      *  Image Fetcher 0
    *  Java3D
      *  MasterControl
        *  管理消息转发与线程调度
        *  J3dMessage
      *  BehaviorScheduler
      *  InputDeviceScheduler
      *  Render
        *  J3D-Renderer-INSTANCE
      *  StructureUpdateThread
        *  Geometry
        *  Render
        *  Behavior
        *  Sound
        *  RenderingAttributes
        *  RenderingEnvironment
        *  Transform
        *  SoundScheduler
      *  TimerThread
##实际应用##
*  CT
  *  MCA 利用切面构造三角形
  *  Volume Rendering 体构造
##OpenGL##
*  Install
  *  Ubuntu
    *  http://stackoverflow.com/questions/859501/learning-opengl-in-ubuntu
    *  http://ubuntuforums.org/showthread.php?t=375425
*  Libs
  *  -lglut -lGLU
