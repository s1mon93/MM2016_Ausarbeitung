<?xml version='1.0' encoding='ISO-8859-1' standalone='yes' ?>
<tagfile>
  <compound kind="file">
    <name>gldefines.h</name>
    <path>/home/walter/MM_2013/Qml2OpenGl_Praktikumsvorlage/src/</path>
    <filename>gldefines_8h</filename>
  </compound>
  <compound kind="file">
    <name>main.cpp</name>
    <path>/home/walter/MM_2013/Qml2OpenGl_Praktikumsvorlage/src/</path>
    <filename>main_8cpp</filename>
    <member kind="function">
      <type>int</type>
      <name>main</name>
      <anchorfile>main_8cpp.html</anchorfile>
      <anchor>a0ddf1224851353fc92bfbff6f499fa97</anchor>
      <arglist>(int argc, char *argv[])</arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>ChessBoard</name>
    <filename>classChessBoard.html</filename>
    <base>GlBody</base>
    <member kind="function">
      <type></type>
      <name>ChessBoard</name>
      <anchorfile>classChessBoard.html</anchorfile>
      <anchor>a442db319ead5600ba57e565ce151d27e</anchor>
      <arglist>(const QVector3D &amp;center=v_Zero, GLdouble squareSize=1.0)</arglist>
    </member>
    <member kind="function">
      <type>QVector3D</type>
      <name>fieldToPosition</name>
      <anchorfile>classChessBoard.html</anchorfile>
      <anchor>ad24ab82ef415d0a92bc0510e62d419df</anchor>
      <arglist>(QPoint field)</arglist>
    </member>
    <member kind="function">
      <type>GLfloat</type>
      <name>getSquareSize</name>
      <anchorfile>classChessBoard.html</anchorfile>
      <anchor>aaaf8b84426191d73a6c4f70b93a8a926</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>raiseDisc</name>
      <anchorfile>classChessBoard.html</anchorfile>
      <anchor>a2d83963ef0a4b4b7f220e9dd6b1c3bcc</anchor>
      <arglist>(GlDisc *disc, QPoint field)</arglist>
    </member>
    <member kind="function">
      <type>bool</type>
      <name>isOnBoard</name>
      <anchorfile>classChessBoard.html</anchorfile>
      <anchor>ab0cfb6589ebffd77da413cda1499e967</anchor>
      <arglist>(const QVector3D &amp;position)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>makeSurface</name>
      <anchorfile>classChessBoard.html</anchorfile>
      <anchor>a1068f2863b87fadf072a387613932d0c</anchor>
      <arglist>(QVector&lt; GlPoint &gt; *pointContainer=NULL, QVector&lt; GLshort &gt; *indexContainer=NULL)</arglist>
    </member>
    <member kind="variable" protection="protected">
      <type>QVector3D</type>
      <name>m_normal</name>
      <anchorfile>classChessBoard.html</anchorfile>
      <anchor>a24d39b7097bf4d75eb3c0294250ff418</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable" protection="protected">
      <type>GLfloat</type>
      <name>m_squareSize</name>
      <anchorfile>classChessBoard.html</anchorfile>
      <anchor>abbd2d5a5452c6b37efa14d0349f2c848</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>Draughts</name>
    <filename>classDraughts.html</filename>
    <member kind="slot">
      <type>void</type>
      <name>slotAnimation</name>
      <anchorfile>classDraughts.html</anchorfile>
      <anchor>a7b1dfd630422a7537381c4ac34554bf3</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="signal">
      <type>void</type>
      <name>updateRequest</name>
      <anchorfile>classDraughts.html</anchorfile>
      <anchor>ae4f79d9d0d14c87cc4b4c45835bbf5ce</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="signal">
      <type>void</type>
      <name>playerChanged</name>
      <anchorfile>classDraughts.html</anchorfile>
      <anchor>a156fcc56e16d622c366910e49b921a96</anchor>
      <arglist>(Draughts::Player newPlayer)</arglist>
    </member>
    <member kind="signal">
      <type>void</type>
      <name>soundRequest</name>
      <anchorfile>classDraughts.html</anchorfile>
      <anchor>ae64c861d8ffaddff5db23a96a4cb1a59</anchor>
      <arglist>(const QString &amp;soundFileName)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>Draughts</name>
      <anchorfile>classDraughts.html</anchorfile>
      <anchor>a1884db32891c3dc68e9578e8fd193543</anchor>
      <arglist>(QObject *parent=0)</arglist>
    </member>
    <member kind="function">
      <type>bool</type>
      <name>selectDisc</name>
      <anchorfile>classDraughts.html</anchorfile>
      <anchor>ad01ece14154ff19c60d53d04a0cd06d2</anchor>
      <arglist>(const QVector3D &amp;nearPoint, const QVector3D &amp;farPoint, const QVector3D &amp;camera)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>unselectDisc</name>
      <anchorfile>classDraughts.html</anchorfile>
      <anchor>ae5578232d3ec5b5c03b347a983598c34</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>QVector3D</type>
      <name>moveDisc</name>
      <anchorfile>classDraughts.html</anchorfile>
      <anchor>adce1a1c1c5d623029b8c4621abf8f8f1</anchor>
      <arglist>(const QVector3D &amp;moveCommand)</arglist>
    </member>
    <member kind="function" virtualness="virtual">
      <type>virtual void</type>
      <name>draw</name>
      <anchorfile>classDraughts.html</anchorfile>
      <anchor>acd1f112ac79ef565c6e3c4622f0797d2</anchor>
      <arglist>(GLESRenderer *renderer)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>changePlayer</name>
      <anchorfile>classDraughts.html</anchorfile>
      <anchor>a2471795c35a8e2356d4f734afaa7cb78</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>setSoundFile</name>
      <anchorfile>classDraughts.html</anchorfile>
      <anchor>aac11203b3c8ca32c21505096e9dd04dd</anchor>
      <arglist>(SoundEvent se, const QString &amp;fileName)</arglist>
    </member>
    <member kind="function">
      <type>const QMatrix4x4 &amp;</type>
      <name>getMvMatrix</name>
      <anchorfile>classDraughts.html</anchorfile>
      <anchor>a4824d42dd273e65b06fe67b1dda7c15a</anchor>
      <arglist>()</arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>DraughtsScene</name>
    <filename>classDraughtsScene.html</filename>
    <base>GlItem</base>
    <member kind="slot">
      <type>void</type>
      <name>mousePressed</name>
      <anchorfile>classDraughtsScene.html</anchorfile>
      <anchor>abfc0c21c6044d89469bf91420a6f3efc</anchor>
      <arglist>(int x, int y)</arglist>
    </member>
    <member kind="slot">
      <type>void</type>
      <name>mousePositionChanged</name>
      <anchorfile>classDraughtsScene.html</anchorfile>
      <anchor>a073d26b17186c38f88fac092a16cca7b</anchor>
      <arglist>(int x, int y)</arglist>
    </member>
    <member kind="slot">
      <type>void</type>
      <name>mouseReleased</name>
      <anchorfile>classDraughtsScene.html</anchorfile>
      <anchor>a6c995a9f5e9e32e38a456df9b454fe87</anchor>
      <arglist>(int x, int y)</arglist>
    </member>
    <member kind="slot">
      <type>void</type>
      <name>synchronizeThreads</name>
      <anchorfile>classDraughtsScene.html</anchorfile>
      <anchor>a82c061e89fc7e4267ccd15e68ff434e0</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>DraughtsScene</name>
      <anchorfile>classDraughtsScene.html</anchorfile>
      <anchor>a82e2f8a4f8039a290b31485140964af4</anchor>
      <arglist>(QQuickItem *parent=0)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>paintUnderQmlScene</name>
      <anchorfile>classDraughtsScene.html</anchorfile>
      <anchor>ab40dbf2854e77d0120aa87bf75babb9d</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function" virtualness="virtual">
      <type>virtual void</type>
      <name>paintOnTopOfQmlScene</name>
      <anchorfile>classDraughtsScene.html</anchorfile>
      <anchor>a7f1f5a2eeaf6b436766289cd28ce3f23</anchor>
      <arglist>()</arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>GlBody</name>
    <filename>classGlBody.html</filename>
    <member kind="function">
      <type></type>
      <name>GlBody</name>
      <anchorfile>classGlBody.html</anchorfile>
      <anchor>aabc718c4f95a7b64b1219896dcd7ff30</anchor>
      <arglist>(float radius=1.0, const GlColorRgba &amp;color=GlColorRgba::clBlue, const QString textureFile=&quot;&quot;)</arglist>
    </member>
    <member kind="function" virtualness="virtual">
      <type>virtual</type>
      <name>~GlBody</name>
      <anchorfile>classGlBody.html</anchorfile>
      <anchor>aa79d08a502765901289dee5f0783cbdb</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function" virtualness="virtual">
      <type>virtual void</type>
      <name>makeSurface</name>
      <anchorfile>classGlBody.html</anchorfile>
      <anchor>a75a275daa56522f9923a499ed24ae467</anchor>
      <arglist>(QVector&lt; GlPoint &gt; *pointContainer=NULL, QVector&lt; GLshort &gt; *indexContainer=NULL)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>invalidateSurface</name>
      <anchorfile>classGlBody.html</anchorfile>
      <anchor>aa495da87f9a7230a314c0ffbdfd9b2d1</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function" virtualness="virtual">
      <type>virtual void</type>
      <name>draw</name>
      <anchorfile>classGlBody.html</anchorfile>
      <anchor>a5a3b1ece911dc25a05165e9761fd6400</anchor>
      <arglist>(GLESRenderer *renderer)</arglist>
    </member>
    <member kind="function" virtualness="virtual">
      <type>virtual bool</type>
      <name>isHit</name>
      <anchorfile>classGlBody.html</anchorfile>
      <anchor>af7ff987e39ce23c8e757e384f1125814</anchor>
      <arglist>(QVector3D p1, QVector3D p2)</arglist>
    </member>
    <member kind="function" virtualness="virtual">
      <type>virtual bool</type>
      <name>spheresAreColliding</name>
      <anchorfile>classGlBody.html</anchorfile>
      <anchor>a8059379ac92111b1545fe234d79cd243</anchor>
      <arglist>(const GlBody *other)</arglist>
    </member>
    <member kind="function">
      <type>bool</type>
      <name>setTexture</name>
      <anchorfile>classGlBody.html</anchorfile>
      <anchor>ac953fcea47f98ae573483ebb3fbf5c94</anchor>
      <arglist>(const QString &amp;m_textureFile)</arglist>
    </member>
    <member kind="function">
      <type>bool</type>
      <name>setTextureFile</name>
      <anchorfile>classGlBody.html</anchorfile>
      <anchor>a2c4231e1fa8a9d58ca587f2675e1a411</anchor>
      <arglist>(const QString &amp;m_textureFile)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>move</name>
      <anchorfile>classGlBody.html</anchorfile>
      <anchor>a8041b1dbca545b74f9ff1badd0ec1875</anchor>
      <arglist>(QVector3D vMove)</arglist>
    </member>
    <member kind="function">
      <type>bool</type>
      <name>isSelected</name>
      <anchorfile>classGlBody.html</anchorfile>
      <anchor>a7a3350c0ce12e022f5f7926ed3483469</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>const QVector3D &amp;</type>
      <name>getCenter</name>
      <anchorfile>classGlBody.html</anchorfile>
      <anchor>a0d25804689ff2cf2d5ecf25ad3cd8eff</anchor>
      <arglist>() const </arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>setColor</name>
      <anchorfile>classGlBody.html</anchorfile>
      <anchor>ae08a7e45db306520b5414f0b539b4cc4</anchor>
      <arglist>(const GlColorRgba &amp;newVal)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>setSpecularColor</name>
      <anchorfile>classGlBody.html</anchorfile>
      <anchor>a9dd24095772a5ffda2e8beb4e680fe2f</anchor>
      <arglist>(const GlColorRgba &amp;newVal)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>setShininess</name>
      <anchorfile>classGlBody.html</anchorfile>
      <anchor>aadcb6d90c3b96772bd6e0671f088b842</anchor>
      <arglist>(int newVal)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>setSelected</name>
      <anchorfile>classGlBody.html</anchorfile>
      <anchor>a2b7588001ed8b303de21a1c85d2389bb</anchor>
      <arglist>(bool newVal)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>setDrawingMode</name>
      <anchorfile>classGlBody.html</anchorfile>
      <anchor>abd45e2fabd682a3918bd35c2a240fab4</anchor>
      <arglist>(GLint newVal)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>setCenter</name>
      <anchorfile>classGlBody.html</anchorfile>
      <anchor>a2bd291dcd9de7a6bea3a2f91c917c0ec</anchor>
      <arglist>(const QVector3D &amp;newVal)</arglist>
    </member>
    <member kind="function">
      <type>const GlColorRgba &amp;</type>
      <name>getColor</name>
      <anchorfile>classGlBody.html</anchorfile>
      <anchor>a446225f551294a95aa562a0dd528d963</anchor>
      <arglist>() const </arglist>
    </member>
    <member kind="function">
      <type>GLfloat</type>
      <name>getRadius</name>
      <anchorfile>classGlBody.html</anchorfile>
      <anchor>a6c8ce9a6a3257abbfb687bf7d5d48d77</anchor>
      <arglist>() const </arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>setRadius</name>
      <anchorfile>classGlBody.html</anchorfile>
      <anchor>a7468cbb12145035306e846cc902afb1f</anchor>
      <arglist>(const GLfloat &amp;radius)</arglist>
    </member>
    <member kind="variable" protection="protected">
      <type>QVector3D</type>
      <name>m_center</name>
      <anchorfile>classGlBody.html</anchorfile>
      <anchor>ae88aaac5ee89dd78c1f2271b0e21631a</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable" protection="protected">
      <type>GLfloat</type>
      <name>m_radius</name>
      <anchorfile>classGlBody.html</anchorfile>
      <anchor>a8c3ec5c2f46f68d34d9beb1264f509f8</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable" protection="protected">
      <type>GLint</type>
      <name>m_drawingMode</name>
      <anchorfile>classGlBody.html</anchorfile>
      <anchor>aa000b3540ccadd2f62e80fd6ffa9bb40</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable" protection="protected">
      <type>QVector&lt; GlPoint &gt; *</type>
      <name>m_points</name>
      <anchorfile>classGlBody.html</anchorfile>
      <anchor>acea52d339dfbb5dd296dc1d0ecd2090d</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable" protection="protected">
      <type>bool</type>
      <name>m_ownPointsContainer</name>
      <anchorfile>classGlBody.html</anchorfile>
      <anchor>a7734b76906bad79349b2e607e4dfd5b2</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable" protection="protected">
      <type>int</type>
      <name>m_firstPoint</name>
      <anchorfile>classGlBody.html</anchorfile>
      <anchor>a9aa6e8df17aead470b2c319f024ce40a</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable" protection="protected">
      <type>int</type>
      <name>m_nextPoint</name>
      <anchorfile>classGlBody.html</anchorfile>
      <anchor>a59dc5cdf9869acfe90c82c5fff577e2a</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable" protection="protected">
      <type>QVector&lt; GLshort &gt; *</type>
      <name>m_indices</name>
      <anchorfile>classGlBody.html</anchorfile>
      <anchor>ace39061f722aacbeb676fabad4f32b7f</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable" protection="protected">
      <type>bool</type>
      <name>m_ownIndexContainer</name>
      <anchorfile>classGlBody.html</anchorfile>
      <anchor>a0408d029bbc07615b3c34a22202c4ad6</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable" protection="protected">
      <type>int</type>
      <name>m_firstIndex</name>
      <anchorfile>classGlBody.html</anchorfile>
      <anchor>a3db2bd4ed30126d00bd9a03d1100a777</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable" protection="protected">
      <type>int</type>
      <name>m_nextIndex</name>
      <anchorfile>classGlBody.html</anchorfile>
      <anchor>a6c4c1da7d6b65344470e0825a7c92ade</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable" protection="protected">
      <type>bool</type>
      <name>m_surfaceIsValid</name>
      <anchorfile>classGlBody.html</anchorfile>
      <anchor>a0e8dda5e3908dedc6519e7b4c83f2d42</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable" protection="protected">
      <type>GLuint</type>
      <name>m_texture</name>
      <anchorfile>classGlBody.html</anchorfile>
      <anchor>ab558fdf0e14043801097936d56c3d5fe</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable" protection="protected">
      <type>QString</type>
      <name>m_textureFile</name>
      <anchorfile>classGlBody.html</anchorfile>
      <anchor>a9b0ee1986c6f597281eb025c623377a8</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable" protection="protected">
      <type>GlColorRgba</type>
      <name>m_color</name>
      <anchorfile>classGlBody.html</anchorfile>
      <anchor>af770b1df29c25987279805883bd20dbe</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable" protection="protected">
      <type>GlColorRgba</type>
      <name>m_specularColor</name>
      <anchorfile>classGlBody.html</anchorfile>
      <anchor>a45284ebfcf490e20e6c849d24f1c7bed</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable" protection="protected">
      <type>int</type>
      <name>m_shininess</name>
      <anchorfile>classGlBody.html</anchorfile>
      <anchor>a97985f619ccf6e6daddbc85ba8b810d4</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable" protection="protected">
      <type>bool</type>
      <name>m_selected</name>
      <anchorfile>classGlBody.html</anchorfile>
      <anchor>a3b368bf808d06caa779fdfd46a0af469</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>GlColorRgba</name>
    <filename>classGlColorRgba.html</filename>
    <member kind="function">
      <type></type>
      <name>GlColorRgba</name>
      <anchorfile>classGlColorRgba.html</anchorfile>
      <anchor>a0dfe1c2c15155db1cf1bef48b50c4051</anchor>
      <arglist>(float r=0.0, float g=0.0, float b=0.0, float a=1.0)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>GlColorRgba</name>
      <anchorfile>classGlColorRgba.html</anchorfile>
      <anchor>a9de65b142d7f0bfc4c31135733586f44</anchor>
      <arglist>(const GlColorRgba &amp;other)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>GlColorRgba</name>
      <anchorfile>classGlColorRgba.html</anchorfile>
      <anchor>a6de29273cabbe124111410fe09fd509e</anchor>
      <arglist>(const QVector4D &amp;other)</arglist>
    </member>
    <member kind="function">
      <type>GlColorRgba</type>
      <name>inverted</name>
      <anchorfile>classGlColorRgba.html</anchorfile>
      <anchor>ab9b2642fbd20335d4aa4c021be2c069c</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>GlColorRgba</type>
      <name>operator*</name>
      <anchorfile>classGlColorRgba.html</anchorfile>
      <anchor>a91029d14577009df6e6b4d9813f8aebb</anchor>
      <arglist>(float factor)</arglist>
    </member>
    <member kind="function">
      <type>float</type>
      <name>red</name>
      <anchorfile>classGlColorRgba.html</anchorfile>
      <anchor>a5e1c3d29b59fd4ea74b546226f97bb41</anchor>
      <arglist>() const </arglist>
    </member>
    <member kind="function">
      <type>float</type>
      <name>green</name>
      <anchorfile>classGlColorRgba.html</anchorfile>
      <anchor>a1f8196dd37bfd4bfd72e1ee2335f5fb0</anchor>
      <arglist>() const </arglist>
    </member>
    <member kind="function">
      <type>float</type>
      <name>blue</name>
      <anchorfile>classGlColorRgba.html</anchorfile>
      <anchor>a0f718c6c50ccd02c347319c77596ffce</anchor>
      <arglist>() const </arglist>
    </member>
    <member kind="function">
      <type>float</type>
      <name>alpha</name>
      <anchorfile>classGlColorRgba.html</anchorfile>
      <anchor>abb2d0f308bf6e90e6cf196475a05b88f</anchor>
      <arglist>() const </arglist>
    </member>
    <member kind="variable" static="yes">
      <type>static GlColorRgba</type>
      <name>clBlack</name>
      <anchorfile>classGlColorRgba.html</anchorfile>
      <anchor>ac76a249abd47ad3f708d5e90d8a2abc7</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable" static="yes">
      <type>static GlColorRgba</type>
      <name>clRed</name>
      <anchorfile>classGlColorRgba.html</anchorfile>
      <anchor>a1b4f78c7a7371980596719298276855b</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable" static="yes">
      <type>static GlColorRgba</type>
      <name>clYellow</name>
      <anchorfile>classGlColorRgba.html</anchorfile>
      <anchor>a9174b42c60a3dee2977d9a1486405b5a</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable" static="yes">
      <type>static GlColorRgba</type>
      <name>clGreen</name>
      <anchorfile>classGlColorRgba.html</anchorfile>
      <anchor>a1e24512ed571b6b39adfcff90258f994</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable" static="yes">
      <type>static GlColorRgba</type>
      <name>clCyan</name>
      <anchorfile>classGlColorRgba.html</anchorfile>
      <anchor>a6b7085659d325ae8861367621fd7c866</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable" static="yes">
      <type>static GlColorRgba</type>
      <name>clBlue</name>
      <anchorfile>classGlColorRgba.html</anchorfile>
      <anchor>a45efe9d07eab2a43961f3c030ecf4cde</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable" static="yes">
      <type>static GlColorRgba</type>
      <name>clMagenta</name>
      <anchorfile>classGlColorRgba.html</anchorfile>
      <anchor>a07e9a39d0cc2298ca7e594e7eaa21d2d</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable" static="yes">
      <type>static GlColorRgba</type>
      <name>clGray</name>
      <anchorfile>classGlColorRgba.html</anchorfile>
      <anchor>a94527488e754bfbe784c26a9db4251fc</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable" static="yes">
      <type>static GlColorRgba</type>
      <name>clWhite</name>
      <anchorfile>classGlColorRgba.html</anchorfile>
      <anchor>a995f9c5446ebfd221f90aaafaa4702af</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>GlCube</name>
    <filename>classGlCube.html</filename>
    <base>GlBody</base>
    <member kind="function">
      <type></type>
      <name>GlCube</name>
      <anchorfile>classGlCube.html</anchorfile>
      <anchor>a3cdd77879329af0b64392437e13dccfb</anchor>
      <arglist>(const QVector3D &amp;llb=v_Zero, const QVector3D &amp;urf=v_XYZ)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>makeSurface</name>
      <anchorfile>classGlCube.html</anchorfile>
      <anchor>a77f759b9ece24101a8ca279784381353</anchor>
      <arglist>(QVector&lt; GlPoint &gt; *pointContainer, QVector&lt; GLshort &gt; *indexContainer)</arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>GlDisc</name>
    <filename>classGlDisc.html</filename>
    <base>GlBody</base>
    <member kind="function">
      <type></type>
      <name>GlDisc</name>
      <anchorfile>classGlDisc.html</anchorfile>
      <anchor>a1490f41c22a16e45ed28b5ff7e255fef</anchor>
      <arglist>(const QPoint &amp;fieldCoord, float m_radius=1.0, const GlColorRgba &amp;m_color=GlColorRgba::clBlue, const QString m_textureFile=&quot;&quot;, double height=0.5, int slices=36)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>makeSurface</name>
      <anchorfile>classGlDisc.html</anchorfile>
      <anchor>ad4f525bee00469e5743c3e6dd4c4f462</anchor>
      <arglist>(QVector&lt; GlPoint &gt; *pointContainer=NULL, QVector&lt; GLshort &gt; *indexContainer=NULL)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>draw</name>
      <anchorfile>classGlDisc.html</anchorfile>
      <anchor>adfd00f4694f9e8f8e6ed5b1d7713206b</anchor>
      <arglist>(GLESRenderer *renderer)</arglist>
    </member>
    <member kind="function">
      <type>double</type>
      <name>getHeight</name>
      <anchorfile>classGlDisc.html</anchorfile>
      <anchor>a70038f914df1150b2a9724878f4f9947</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>QPoint</type>
      <name>getFieldCoord</name>
      <anchorfile>classGlDisc.html</anchorfile>
      <anchor>ae596e58cdef20ddd269cebee324a8bfc</anchor>
      <arglist>() const </arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>setFieldCoord</name>
      <anchorfile>classGlDisc.html</anchorfile>
      <anchor>ad25f1e73d8820948fcb91ba89ad77c7d</anchor>
      <arglist>(const QPoint &amp;FieldCoord)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>becomeKing</name>
      <anchorfile>classGlDisc.html</anchorfile>
      <anchor>a479b488f7f4c36c0ab2fe3f308cdfe50</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>bool</type>
      <name>isKing</name>
      <anchorfile>classGlDisc.html</anchorfile>
      <anchor>a24e540413616216d99a7e0587d3ff6b2</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>bool</type>
      <name>isColliding</name>
      <anchorfile>classGlDisc.html</anchorfile>
      <anchor>a4779a93d3f9127a874eba1e48fd3646a</anchor>
      <arglist>(const GlDisc *other)</arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>GLESBody</name>
    <filename>classGLESBody.html</filename>
    <member kind="function">
      <type></type>
      <name>GLESBody</name>
      <anchorfile>classGLESBody.html</anchorfile>
      <anchor>ac3405c22dfb5e486838db97f681cf099</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function" virtualness="virtual">
      <type>virtual</type>
      <name>~GLESBody</name>
      <anchorfile>classGLESBody.html</anchorfile>
      <anchor>a31fbd73691a698ccf1289a2b0435cb29</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function" virtualness="virtual">
      <type>virtual void</type>
      <name>makeSurface</name>
      <anchorfile>classGLESBody.html</anchorfile>
      <anchor>a8cc2d91cde87837819c4995f54d4d4bf</anchor>
      <arglist>(QVector&lt; GlPoint &gt; *pointContainer)</arglist>
    </member>
    <member kind="function" virtualness="virtual">
      <type>virtual void</type>
      <name>draw</name>
      <anchorfile>classGLESBody.html</anchorfile>
      <anchor>ad2fd7005f8b192c639866e0a7d6c3306</anchor>
      <arglist>(GLESRenderer *renderer)</arglist>
    </member>
    <member kind="function" virtualness="virtual">
      <type>virtual bool</type>
      <name>isHit</name>
      <anchorfile>classGLESBody.html</anchorfile>
      <anchor>a5fc8958058b714bc15ff56cbadefbdc6</anchor>
      <arglist>(QVector3D p1, QVector3D p2)</arglist>
    </member>
    <member kind="function" virtualness="virtual">
      <type>virtual bool</type>
      <name>spheresAreColliding</name>
      <anchorfile>classGLESBody.html</anchorfile>
      <anchor>a5a4858b057c4b1ab02f16be28c986cab</anchor>
      <arglist>(const GLESBody *other)</arglist>
    </member>
    <member kind="function">
      <type>bool</type>
      <name>setTexture</name>
      <anchorfile>classGLESBody.html</anchorfile>
      <anchor>a3c31ed3c95fe394af3e5b036f5ab2106</anchor>
      <arglist>(const QString &amp;textureFile)</arglist>
    </member>
    <member kind="function">
      <type>bool</type>
      <name>setTextureFile</name>
      <anchorfile>classGLESBody.html</anchorfile>
      <anchor>a7f4be8aca89596595aa0083767da46c4</anchor>
      <arglist>(const QString &amp;textureFile)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>move</name>
      <anchorfile>classGLESBody.html</anchorfile>
      <anchor>ad0c2f5d18c7ab322b0ef05604c9e0664</anchor>
      <arglist>(QVector3D vMove)</arglist>
    </member>
    <member kind="function">
      <type>bool</type>
      <name>isSelected</name>
      <anchorfile>classGLESBody.html</anchorfile>
      <anchor>ad0ca532e001e54e4fe376f77b8e6e3df</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>const QVector3D &amp;</type>
      <name>getCenter</name>
      <anchorfile>classGLESBody.html</anchorfile>
      <anchor>a3973b15f63bfdf1ae27ca6d092ea8267</anchor>
      <arglist>() const </arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>setColor</name>
      <anchorfile>classGLESBody.html</anchorfile>
      <anchor>afb80071138a5ddf5888c5d93e6855082</anchor>
      <arglist>(const GlColorRgba &amp;newVal)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>setSpecularColor</name>
      <anchorfile>classGLESBody.html</anchorfile>
      <anchor>a1e26ee13ddc99aa98a4f39aa3ce7f70e</anchor>
      <arglist>(const GlColorRgba &amp;newVal)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>setShininess</name>
      <anchorfile>classGLESBody.html</anchorfile>
      <anchor>a1a01091f267c9d9a019941b0ed8a71da</anchor>
      <arglist>(int newVal)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>setSelected</name>
      <anchorfile>classGLESBody.html</anchorfile>
      <anchor>a87613460c439bcd7e82783ef4a7d75c8</anchor>
      <arglist>(bool newVal)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>setCenter</name>
      <anchorfile>classGLESBody.html</anchorfile>
      <anchor>a47c76411a4806f74b7d5684080b098df</anchor>
      <arglist>(const QVector3D &amp;newVal)</arglist>
    </member>
    <member kind="function">
      <type>const GlColorRgba &amp;</type>
      <name>getColor</name>
      <anchorfile>classGLESBody.html</anchorfile>
      <anchor>ae1915ffb8fa8915adba8d8a471a07ef3</anchor>
      <arglist>() const </arglist>
    </member>
    <member kind="variable" protection="protected">
      <type>QVector3D</type>
      <name>center</name>
      <anchorfile>classGLESBody.html</anchorfile>
      <anchor>a89cd604c12f133a40931ffd9d8c247e9</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable" protection="protected">
      <type>GLfloat</type>
      <name>radius</name>
      <anchorfile>classGLESBody.html</anchorfile>
      <anchor>aca6ed0608d0c5fae3fb834cda20a4016</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable" protection="protected">
      <type>QVector&lt; GlPoint &gt; *</type>
      <name>points</name>
      <anchorfile>classGLESBody.html</anchorfile>
      <anchor>a4b08f801003c46e647d1c882fe8fa18d</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable" protection="protected">
      <type>bool</type>
      <name>ownPointsContainer</name>
      <anchorfile>classGLESBody.html</anchorfile>
      <anchor>ab9076cb792d3cd101bbb0e3d7bfa9e91</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable" protection="protected">
      <type>int</type>
      <name>firstPoint</name>
      <anchorfile>classGLESBody.html</anchorfile>
      <anchor>a52fd63031464aa4b5d9e8739e63a3be2</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable" protection="protected">
      <type>int</type>
      <name>nextPoint</name>
      <anchorfile>classGLESBody.html</anchorfile>
      <anchor>ab8eda0c1a52d55651f88bbf230302a0d</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable" protection="protected">
      <type>QVector&lt; GLshort &gt;</type>
      <name>indices</name>
      <anchorfile>classGLESBody.html</anchorfile>
      <anchor>a02816d205dd3eb7cc43a2f2c0f658548</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable" protection="protected">
      <type>int</type>
      <name>firstIndex</name>
      <anchorfile>classGLESBody.html</anchorfile>
      <anchor>a2f790dd3dca847996286d3ce630cd9f2</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable" protection="protected">
      <type>int</type>
      <name>nextIndex</name>
      <anchorfile>classGLESBody.html</anchorfile>
      <anchor>a004b0dabc9be10e027f7fd389e0c7abe</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable" protection="protected">
      <type>bool</type>
      <name>surfaceIsValid</name>
      <anchorfile>classGLESBody.html</anchorfile>
      <anchor>add1c91a3343811ced9ebc54ae079187a</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable" protection="protected">
      <type>GLuint</type>
      <name>texture</name>
      <anchorfile>classGLESBody.html</anchorfile>
      <anchor>a70a187abd54ecdaae56d2553409a9664</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable" protection="protected">
      <type>QString</type>
      <name>textureFile</name>
      <anchorfile>classGLESBody.html</anchorfile>
      <anchor>a84f45bf6208aebf21af0139a41378427</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable" protection="protected">
      <type>GlColorRgba</type>
      <name>color</name>
      <anchorfile>classGLESBody.html</anchorfile>
      <anchor>af0e4f8aaffc3de22e84de5654ae8a756</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable" protection="protected">
      <type>GlColorRgba</type>
      <name>specularColor</name>
      <anchorfile>classGLESBody.html</anchorfile>
      <anchor>a6e17b62ac43cde2ceea25c0f94cafb90</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable" protection="protected">
      <type>int</type>
      <name>shininess</name>
      <anchorfile>classGLESBody.html</anchorfile>
      <anchor>ab0aff9ad31834b4a31dcdc1782576f9c</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable" protection="protected">
      <type>bool</type>
      <name>selected</name>
      <anchorfile>classGLESBody.html</anchorfile>
      <anchor>ac671d29fdf131668c9fceecf4fcfe521</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>GLESRenderer</name>
    <filename>classGLESRenderer.html</filename>
    <member kind="function">
      <type></type>
      <name>GLESRenderer</name>
      <anchorfile>classGLESRenderer.html</anchorfile>
      <anchor>a0c5bf4702ee731dde0377a08b5e15ae2</anchor>
      <arglist>(QObject *parent, const QString &amp;vShaderFilename=&quot;:/src/vshader.vsh&quot;, const QString &amp;fShaderFilename=&quot;:/src/fshader.fsh&quot;)</arglist>
    </member>
    <member kind="function" virtualness="virtual">
      <type>virtual bool</type>
      <name>initialize</name>
      <anchorfile>classGLESRenderer.html</anchorfile>
      <anchor>a63c130c1514c30d76c096c5633110bc1</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function" virtualness="virtual">
      <type>virtual bool</type>
      <name>bind</name>
      <anchorfile>classGLESRenderer.html</anchorfile>
      <anchor>a6e6b9a8bffe9b236f77248041282175f</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>release</name>
      <anchorfile>classGLESRenderer.html</anchorfile>
      <anchor>a860d9102e98cd4394dc91c56e61c512b</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>QVector3D</type>
      <name>unProjectViewportPoint</name>
      <anchorfile>classGLESRenderer.html</anchorfile>
      <anchor>a8be3d2a634d0fe1e13fb7b97673eefab</anchor>
      <arglist>(const QVector3D &amp;vWin)</arglist>
    </member>
    <member kind="function">
      <type>QVector3D</type>
      <name>viewportToClip</name>
      <anchorfile>classGLESRenderer.html</anchorfile>
      <anchor>a36440b34ef23691928cb033a55c9c6f9</anchor>
      <arglist>(const QVector3D &amp;v)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>calculateMousePoints</name>
      <anchorfile>classGLESRenderer.html</anchorfile>
      <anchor>a18774e053fdf8940dabaaee146f958bd</anchor>
      <arglist>(QVector3D *nearPoint, QVector3D *farPoint, int mouseX, int mouseY)</arglist>
    </member>
    <member kind="function">
      <type>float</type>
      <name>distanceToMouseClick</name>
      <anchorfile>classGLESRenderer.html</anchorfile>
      <anchor>a28f8c3de5d856cbf5c244b591af27dc4</anchor>
      <arglist>(QVector3D p, int mouseX, int mouseY)</arglist>
    </member>
    <member kind="function">
      <type>bool</type>
      <name>mouseIntersection</name>
      <anchorfile>classGLESRenderer.html</anchorfile>
      <anchor>a29f51dcc40b1dfe9234df3c2ddddb989</anchor>
      <arglist>(QVector3D *intersection, QVector3D normal, float d, int mouseX, int mouseY)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>setMvMatrix</name>
      <anchorfile>classGLESRenderer.html</anchorfile>
      <anchor>a8242d0b241a14c5850867ec00819c014</anchor>
      <arglist>(const QMatrix4x4 newVal)</arglist>
    </member>
    <member kind="function">
      <type>const QMatrix4x4 &amp;</type>
      <name>getMvMatrix</name>
      <anchorfile>classGLESRenderer.html</anchorfile>
      <anchor>af6f079ccbe2e37b90018dde13ad36b94</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>const QMatrix3x3 &amp;</type>
      <name>getNormalMatrix</name>
      <anchorfile>classGLESRenderer.html</anchorfile>
      <anchor>a0dfc680c7a7b2aea8439f88a892858fe</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>setLookAt</name>
      <anchorfile>classGLESRenderer.html</anchorfile>
      <anchor>a180fe52b28553039f83b07157b962c3e</anchor>
      <arglist>(const QVector3D &amp;eye, const QVector3D &amp;center, const QVector3D &amp;up)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>setPMatrix</name>
      <anchorfile>classGLESRenderer.html</anchorfile>
      <anchor>ad439b83c368872dfd4439136d9af4d6d</anchor>
      <arglist>(const QMatrix4x4 newVal)</arglist>
    </member>
    <member kind="function">
      <type>const QMatrix4x4 &amp;</type>
      <name>getPMatrix</name>
      <anchorfile>classGLESRenderer.html</anchorfile>
      <anchor>a57700c29516d33449e65e7243eaf2aac</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>setPerspective</name>
      <anchorfile>classGLESRenderer.html</anchorfile>
      <anchor>a66075533051cef0e0a0b92ffce4fcbf7</anchor>
      <arglist>(GLfloat fovy, GLfloat aspect, GLfloat m_nearClip, GLfloat m_farClip)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>setViewport</name>
      <anchorfile>classGLESRenderer.html</anchorfile>
      <anchor>a9715cb674cb2fb4ae0cf13052f063336</anchor>
      <arglist>(int x, int y, int w, int h)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>readGLViewportSettings</name>
      <anchorfile>classGLESRenderer.html</anchorfile>
      <anchor>aadd9caa2f116226fa3d896bbad437e90</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>setAmbientAndDiffuseColor</name>
      <anchorfile>classGLESRenderer.html</anchorfile>
      <anchor>a746868849fa8ca0dc7acea7cbe9417b9</anchor>
      <arglist>(const GlColorRgba newVal)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>setAmbientLightBrightness</name>
      <anchorfile>classGLESRenderer.html</anchorfile>
      <anchor>a0173737627f25d5a0586a57569c211d2</anchor>
      <arglist>(float newVal)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>setSpecularColor</name>
      <anchorfile>classGLESRenderer.html</anchorfile>
      <anchor>a19395052ddb21fdc38fe5ea590fe4c65</anchor>
      <arglist>(const GlColorRgba newVal)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>setShininess</name>
      <anchorfile>classGLESRenderer.html</anchorfile>
      <anchor>a75fdf201c7a27ab2e053e2a5d37e4ac4</anchor>
      <arglist>(float newVal)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>setLightingEnabled</name>
      <anchorfile>classGLESRenderer.html</anchorfile>
      <anchor>ae6e3531d53ffdc334688eec3feaf9e77</anchor>
      <arglist>(bool newVal)</arglist>
    </member>
    <member kind="function">
      <type>bool</type>
      <name>isLightingEnabled</name>
      <anchorfile>classGLESRenderer.html</anchorfile>
      <anchor>a72a9b248926c08a45dfea70b8f0e22ca</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>setColorArrayEnabled</name>
      <anchorfile>classGLESRenderer.html</anchorfile>
      <anchor>a990ae5bda053d007a710e7e9956facf1</anchor>
      <arglist>(bool newVal)</arglist>
    </member>
    <member kind="function">
      <type>bool</type>
      <name>isColorArrayEnabled</name>
      <anchorfile>classGLESRenderer.html</anchorfile>
      <anchor>a79ef99aaf1e080612cad7ce4e77580bd</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>setTextureEnabled</name>
      <anchorfile>classGLESRenderer.html</anchorfile>
      <anchor>a83f1e3ddcb613eea7e74fa6ce4289350</anchor>
      <arglist>(bool newVal)</arglist>
    </member>
    <member kind="function">
      <type>bool</type>
      <name>isTextureEnabled</name>
      <anchorfile>classGLESRenderer.html</anchorfile>
      <anchor>afedd8e9ef1c5804d070f3c79baa15439</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>setLightDirection</name>
      <anchorfile>classGLESRenderer.html</anchorfile>
      <anchor>a4f755a8549d3ecbb2a40cabe56974c5f</anchor>
      <arglist>(const QVector3D &amp;newVal)</arglist>
    </member>
    <member kind="function">
      <type>const QVector3D</type>
      <name>getLightDirection</name>
      <anchorfile>classGLESRenderer.html</anchorfile>
      <anchor>a105f34b7b36e4c2b14899ba110e8b5ee</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>setPointSize</name>
      <anchorfile>classGLESRenderer.html</anchorfile>
      <anchor>a40f98b9d12cdc8f6752f6e940cb011ce</anchor>
      <arglist>(int newVal)</arglist>
    </member>
    <member kind="function">
      <type>int</type>
      <name>getPointSize</name>
      <anchorfile>classGLESRenderer.html</anchorfile>
      <anchor>afd5eb867a52575097b95c547fb6871c1</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>pushMvMatrix</name>
      <anchorfile>classGLESRenderer.html</anchorfile>
      <anchor>a712dddd10f14f80a003a347ff1aa1666</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>popMvMatrix</name>
      <anchorfile>classGLESRenderer.html</anchorfile>
      <anchor>a93ddfbce8f107b0cbc41b2854855202d</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>translate</name>
      <anchorfile>classGLESRenderer.html</anchorfile>
      <anchor>a252caaa926c2e86312b219454492ffe0</anchor>
      <arglist>(const QVector3D &amp;v)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>rotate</name>
      <anchorfile>classGLESRenderer.html</anchorfile>
      <anchor>a9e034d2d95eedc35a56f8db1688df163</anchor>
      <arglist>(GLfloat angle, const QVector3D &amp;axis)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>addTransformation</name>
      <anchorfile>classGLESRenderer.html</anchorfile>
      <anchor>a5a523cfef1b63258e863af159c04c235</anchor>
      <arglist>(const QMatrix4x4 additionalTransformation)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>scale</name>
      <anchorfile>classGLESRenderer.html</anchorfile>
      <anchor>a4bd22f2f738b185f3b6c3e381c58feca</anchor>
      <arglist>(const QVector3D &amp;v)</arglist>
    </member>
    <member kind="function">
      <type>bool</type>
      <name>activateAttributeArray</name>
      <anchorfile>classGLESRenderer.html</anchorfile>
      <anchor>a102377bf45b15bb52324214d2e9b6f14</anchor>
      <arglist>(AttributeLocation location, const QVector3D *values, int stride=0)</arglist>
    </member>
    <member kind="function">
      <type>bool</type>
      <name>activateAttributeArray</name>
      <anchorfile>classGLESRenderer.html</anchorfile>
      <anchor>a8bf8c792ca591b7212c269f57d49b5af</anchor>
      <arglist>(AttributeLocation location, const QVector4D *values, int stride=0)</arglist>
    </member>
    <member kind="function" virtualness="virtual">
      <type>virtual void</type>
      <name>disableAttributeArrays</name>
      <anchorfile>classGLESRenderer.html</anchorfile>
      <anchor>a02c0be9150e474bdb10a7f2640f76cec</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>QVector3D</type>
      <name>modelToClip</name>
      <anchorfile>classGLESRenderer.html</anchorfile>
      <anchor>a5d591173ee2492417476253eb2e41986</anchor>
      <arglist>(const QVector3D &amp;v)</arglist>
    </member>
    <member kind="function">
      <type>QVector3D</type>
      <name>clipToViewport</name>
      <anchorfile>classGLESRenderer.html</anchorfile>
      <anchor>a531ca73b72e3a00a667b9f8237735724</anchor>
      <arglist>(const QVector3D &amp;v)</arglist>
    </member>
    <member kind="variable" protection="protected">
      <type>bool</type>
      <name>m_initialized</name>
      <anchorfile>classGLESRenderer.html</anchorfile>
      <anchor>a2c936870131300b9ed86cf9073747637</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable" protection="protected">
      <type>bool</type>
      <name>m_bound</name>
      <anchorfile>classGLESRenderer.html</anchorfile>
      <anchor>ab4227a6b3394b7392c9a7001fc306ad1</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable" protection="protected">
      <type>bool</type>
      <name>m_lightingEnabled</name>
      <anchorfile>classGLESRenderer.html</anchorfile>
      <anchor>a89a023d2cabec874691841f5ff140bc8</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable" protection="protected">
      <type>bool</type>
      <name>m_colorArrayEnabled</name>
      <anchorfile>classGLESRenderer.html</anchorfile>
      <anchor>a71b59ce0e9ae03eba0ed065bae8ecff7</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable" protection="protected">
      <type>bool</type>
      <name>m_textureEnabled</name>
      <anchorfile>classGLESRenderer.html</anchorfile>
      <anchor>a61680a3953bfb6b22e7131a518b1a5e2</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable" protection="protected">
      <type>bool</type>
      <name>m_invertedMvpMatrixValid</name>
      <anchorfile>classGLESRenderer.html</anchorfile>
      <anchor>a9c58c18b9b58fb4f49bb1fd79f4a2f51</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable" protection="protected">
      <type>QMatrix4x4</type>
      <name>m_mvpMatrix</name>
      <anchorfile>classGLESRenderer.html</anchorfile>
      <anchor>a878a3ee8fe04d1a56659c78ba5e95f4b</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable" protection="protected">
      <type>QMatrix4x4</type>
      <name>m_invertedMvpMatrix</name>
      <anchorfile>classGLESRenderer.html</anchorfile>
      <anchor>af08d271c05f553df400b67685435cb0c</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable" protection="protected">
      <type>QStack&lt; QMatrix4x4 &gt;</type>
      <name>m_mvMatrixStack</name>
      <anchorfile>classGLESRenderer.html</anchorfile>
      <anchor>a5675ffb62f73dc7ebff3e4aea59db56e</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable" protection="protected">
      <type>QMatrix4x4</type>
      <name>m_mvMatrix</name>
      <anchorfile>classGLESRenderer.html</anchorfile>
      <anchor>a2f8a5b98999a5ee14551a39e5f005389</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable" protection="protected">
      <type>QMatrix4x4</type>
      <name>m_pMatrix</name>
      <anchorfile>classGLESRenderer.html</anchorfile>
      <anchor>a2fe2ba5157fa87a9eca8eb15f8097fb5</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable" protection="protected">
      <type>float</type>
      <name>m_nearClip</name>
      <anchorfile>classGLESRenderer.html</anchorfile>
      <anchor>ab29bf2e72c2d91883b1ad3f3e8351940</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable" protection="protected">
      <type>float</type>
      <name>m_farClip</name>
      <anchorfile>classGLESRenderer.html</anchorfile>
      <anchor>a6ecd1dee12a4592f35d097e14f90933b</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable" protection="protected">
      <type>QMatrix3x3</type>
      <name>m_normalMatrix</name>
      <anchorfile>classGLESRenderer.html</anchorfile>
      <anchor>a76ff9b2803ac2a897d9df0cf587601ed</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable" protection="protected">
      <type>QVector3D</type>
      <name>m_lightDirection</name>
      <anchorfile>classGLESRenderer.html</anchorfile>
      <anchor>a7347241a0f6482d69479d10848c70238</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable" protection="protected">
      <type>QVector3D</type>
      <name>m_halfPlaneVector</name>
      <anchorfile>classGLESRenderer.html</anchorfile>
      <anchor>ae3feaa98657e57bbc795a845dfafe1fe</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable" protection="protected">
      <type>GlColorRgba</type>
      <name>m_ambientAndDiffuseColor</name>
      <anchorfile>classGLESRenderer.html</anchorfile>
      <anchor>af757f4b3ad730e772fca35d0e0a196a5</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable" protection="protected">
      <type>float</type>
      <name>m_ambientLightBrightness</name>
      <anchorfile>classGLESRenderer.html</anchorfile>
      <anchor>ad40448fd0cbb01b078a759e5f8d9debc</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable" protection="protected">
      <type>GlColorRgba</type>
      <name>m_specularColor</name>
      <anchorfile>classGLESRenderer.html</anchorfile>
      <anchor>a9cfe59adeb086b4a7b08975a0aa8b31b</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable" protection="protected">
      <type>float</type>
      <name>m_shininess</name>
      <anchorfile>classGLESRenderer.html</anchorfile>
      <anchor>a5cb19e8d00b558a84f3776d51f0aca9c</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable" protection="protected">
      <type>int</type>
      <name>m_pointSize</name>
      <anchorfile>classGLESRenderer.html</anchorfile>
      <anchor>abecb011e09f5ec6f1acf2929b8f7bae7</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable" protection="protected">
      <type>QString</type>
      <name>m_vShaderFileName</name>
      <anchorfile>classGLESRenderer.html</anchorfile>
      <anchor>a9f9222c1a54ff9b01edb609bb570151a</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable" protection="protected">
      <type>QString</type>
      <name>m_fShaderFileName</name>
      <anchorfile>classGLESRenderer.html</anchorfile>
      <anchor>ac876ef67f2795f17e0f1d1e43cb686b4</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable" protection="protected">
      <type>QOpenGLShader *</type>
      <name>m_vShader</name>
      <anchorfile>classGLESRenderer.html</anchorfile>
      <anchor>a41916fc04d753007a9340065ab08762e</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable" protection="protected">
      <type>QOpenGLShader *</type>
      <name>m_fShader</name>
      <anchorfile>classGLESRenderer.html</anchorfile>
      <anchor>a63dd17ddf099e24a26a9d7cdeab664fa</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable" protection="protected">
      <type>QOpenGLShaderProgram *</type>
      <name>m_renderProgram</name>
      <anchorfile>classGLESRenderer.html</anchorfile>
      <anchor>a49b1f32fad69d86fb7522d1a3f1e8d4f</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable" protection="protected">
      <type>int</type>
      <name>m_location_aVertex</name>
      <anchorfile>classGLESRenderer.html</anchorfile>
      <anchor>ab03a79822dd105e1a0e5eecb65ee492b</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable" protection="protected">
      <type>int</type>
      <name>m_location_aColor</name>
      <anchorfile>classGLESRenderer.html</anchorfile>
      <anchor>a5bf9f36f33237a7fe2706f60c341dec9</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable" protection="protected">
      <type>int</type>
      <name>m_location_aNormal</name>
      <anchorfile>classGLESRenderer.html</anchorfile>
      <anchor>adca575c93185a1beb32bf54235a7766f</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable" protection="protected">
      <type>int</type>
      <name>m_location_aTexCoord</name>
      <anchorfile>classGLESRenderer.html</anchorfile>
      <anchor>af5b18a94719f0b93d32be7cd9262fcfb</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable" protection="protected">
      <type>int</type>
      <name>m_location_uColorArrayEnabled</name>
      <anchorfile>classGLESRenderer.html</anchorfile>
      <anchor>aafa0944ec42f35eb2ebf08fe0e850ad7</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable" protection="protected">
      <type>int</type>
      <name>m_location_uLightingEnabled</name>
      <anchorfile>classGLESRenderer.html</anchorfile>
      <anchor>a8d61c896b68041ae2439d21ed6981f28</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable" protection="protected">
      <type>int</type>
      <name>m_location_uNormalMatrix</name>
      <anchorfile>classGLESRenderer.html</anchorfile>
      <anchor>aec01e0adb9416c451d958f925a64d329</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable" protection="protected">
      <type>int</type>
      <name>m_location_uMvpMatrix</name>
      <anchorfile>classGLESRenderer.html</anchorfile>
      <anchor>a51a95f6a35efdde4a6e103ecae334322</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable" protection="protected">
      <type>int</type>
      <name>m_location_uAmbientAndDiffuseColor</name>
      <anchorfile>classGLESRenderer.html</anchorfile>
      <anchor>a4125a33e9cea4fbc0e7e23edb4b4de43</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable" protection="protected">
      <type>int</type>
      <name>m_location_uAmbientLightBrightness</name>
      <anchorfile>classGLESRenderer.html</anchorfile>
      <anchor>a0dc79f50f3eea91e32316a6ecd8a9754</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable" protection="protected">
      <type>int</type>
      <name>m_location_uSpecularColor</name>
      <anchorfile>classGLESRenderer.html</anchorfile>
      <anchor>a0945edb3cd12c3228e405519d9cebe08</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable" protection="protected">
      <type>int</type>
      <name>m_location_uShininess</name>
      <anchorfile>classGLESRenderer.html</anchorfile>
      <anchor>af1152640d14a616c9930161402da5eb3</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable" protection="protected">
      <type>int</type>
      <name>m_location_uLightDirection</name>
      <anchorfile>classGLESRenderer.html</anchorfile>
      <anchor>aba8a7f233b51b258542adce7114a93da</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable" protection="protected">
      <type>int</type>
      <name>m_location_uHalfPlaneVector</name>
      <anchorfile>classGLESRenderer.html</anchorfile>
      <anchor>a8a4088b65277a3efa4810454c00e6a16</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable" protection="protected">
      <type>int</type>
      <name>m_location_uPointSize</name>
      <anchorfile>classGLESRenderer.html</anchorfile>
      <anchor>a3cab0140a32534203dc8070058647d02</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable" protection="protected">
      <type>int</type>
      <name>m_location_uTextureSampler</name>
      <anchorfile>classGLESRenderer.html</anchorfile>
      <anchor>ac2f2a0039e1b58fbd7d5abd3c43640bc</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable" protection="protected">
      <type>int</type>
      <name>m_location_uTextureEnabled</name>
      <anchorfile>classGLESRenderer.html</anchorfile>
      <anchor>a82f6728d7361a42c33f0e88be7a329a2</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable" protection="protected">
      <type>QList&lt; int &gt;</type>
      <name>m_activeAttributeLocations</name>
      <anchorfile>classGLESRenderer.html</anchorfile>
      <anchor>a923229687ee02d0364a7e472fa1ed578</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable" protection="protected">
      <type>int</type>
      <name>m_viewportX</name>
      <anchorfile>classGLESRenderer.html</anchorfile>
      <anchor>a437c4d81da1b944458b4abde903c23ce</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable" protection="protected">
      <type>int</type>
      <name>m_viewportY</name>
      <anchorfile>classGLESRenderer.html</anchorfile>
      <anchor>a0e81b88aa0c613e99dc6be1737d83c93</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable" protection="protected">
      <type>int</type>
      <name>m_viewportW</name>
      <anchorfile>classGLESRenderer.html</anchorfile>
      <anchor>af839e0f722a97a026d7517de19acd352</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable" protection="protected">
      <type>int</type>
      <name>m_viewportH</name>
      <anchorfile>classGLESRenderer.html</anchorfile>
      <anchor>a07da628f9769b11914946d71b71a4665</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>GLESRenderer_Scaling</name>
    <filename>classGLESRenderer__Scaling.html</filename>
    <base>GLESRenderer</base>
    <member kind="function">
      <type></type>
      <name>GLESRenderer_Scaling</name>
      <anchorfile>classGLESRenderer__Scaling.html</anchorfile>
      <anchor>afb803237d318c6e6c45211222615f151</anchor>
      <arglist>(QObject *parent, const QString &amp;vShaderFilename=&quot;:/src/vshader_scaling.vsh&quot;, const QString &amp;fShaderFilename=&quot;:/src/fshader.fsh&quot;)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>setScaleMatrix</name>
      <anchorfile>classGLESRenderer__Scaling.html</anchorfile>
      <anchor>a0453228bf87f7cd9d9f78e38ef072d7c</anchor>
      <arglist>(const QMatrix4x4 &amp;scaleMatrix)</arglist>
    </member>
    <member kind="function" virtualness="virtual">
      <type>virtual bool</type>
      <name>initialize</name>
      <anchorfile>classGLESRenderer__Scaling.html</anchorfile>
      <anchor>a3a07b07282b641af5486aa8beae73f8b</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function" virtualness="virtual">
      <type>virtual bool</type>
      <name>bind</name>
      <anchorfile>classGLESRenderer__Scaling.html</anchorfile>
      <anchor>a10dfe3df9b68e96b666b56db53ab80ae</anchor>
      <arglist>()</arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>GlItem</name>
    <filename>classGlItem.html</filename>
    <member kind="slot">
      <type>void</type>
      <name>paintBefore</name>
      <anchorfile>classGlItem.html</anchorfile>
      <anchor>afc4c2bd41291f217875b1fe4db6995e7</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="slot">
      <type>void</type>
      <name>paintAfter</name>
      <anchorfile>classGlItem.html</anchorfile>
      <anchor>a1c8b0ea88707fe21efd7ab518328c852</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="slot">
      <type>void</type>
      <name>toggleMove</name>
      <anchorfile>classGlItem.html</anchorfile>
      <anchor>ad7e9cb9c81afbf17e7923c67beb353c3</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="slot">
      <type>void</type>
      <name>mousePressed</name>
      <anchorfile>classGlItem.html</anchorfile>
      <anchor>a1acc4d79cbfad193bbda917127394a89</anchor>
      <arglist>(int x, int y)</arglist>
    </member>
    <member kind="slot">
      <type>void</type>
      <name>mousePositionChanged</name>
      <anchorfile>classGlItem.html</anchorfile>
      <anchor>aba056835686071dad5997ec4eb50e0ef</anchor>
      <arglist>(int x, int y)</arglist>
    </member>
    <member kind="slot">
      <type>void</type>
      <name>mouseReleased</name>
      <anchorfile>classGlItem.html</anchorfile>
      <anchor>a5af77f980fdce606f9b7cf457c963d22</anchor>
      <arglist>(int x, int y)</arglist>
    </member>
    <member kind="slot">
      <type>void</type>
      <name>setVertexShaderFilename</name>
      <anchorfile>classGlItem.html</anchorfile>
      <anchor>a4a3149b5a9aa25aead1853ad0c3274a1</anchor>
      <arglist>(QString arg)</arglist>
    </member>
    <member kind="slot">
      <type>void</type>
      <name>setFragmentShaderFilename</name>
      <anchorfile>classGlItem.html</anchorfile>
      <anchor>ade65d30746948dab326eda16ca93ed2d</anchor>
      <arglist>(QString arg)</arglist>
    </member>
    <member kind="signal">
      <type>void</type>
      <name>vertexShaderFilenameChanged</name>
      <anchorfile>classGlItem.html</anchorfile>
      <anchor>ab9883b9d521fa61b7cf328979e41dd84</anchor>
      <arglist>(QString arg)</arglist>
    </member>
    <member kind="signal">
      <type>void</type>
      <name>fragmentShaderFilenameChanged</name>
      <anchorfile>classGlItem.html</anchorfile>
      <anchor>a7fc255bfc835606418ab694475f9b93d</anchor>
      <arglist>(QString arg)</arglist>
    </member>
    <member kind="signal">
      <type>void</type>
      <name>debugMovementActiveChanged</name>
      <anchorfile>classGlItem.html</anchorfile>
      <anchor>af0f91cab1269192150b92a038f413ac0</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>GlItem</name>
      <anchorfile>classGlItem.html</anchorfile>
      <anchor>a2d8fcc27adf5615316ea514b4d80077b</anchor>
      <arglist>(QQuickItem *parent=0, const QString &amp;vertexShaderFilename=&quot;:/src/vshader.vsh&quot;, const QString &amp;fragmentShaderFilename=&quot;:/src/fshader.fsh&quot;)</arglist>
    </member>
    <member kind="function">
      <type>QSGNode *</type>
      <name>updatePaintNode</name>
      <anchorfile>classGlItem.html</anchorfile>
      <anchor>af37e63556e9d64006756972efd311bd0</anchor>
      <arglist>(QSGNode *node, UpdatePaintNodeData *)</arglist>
    </member>
    <member kind="function">
      <type>QString</type>
      <name>fragmentShaderFilename</name>
      <anchorfile>classGlItem.html</anchorfile>
      <anchor>a6bbc23b8e9b124f1511adcd9b47e76e5</anchor>
      <arglist>() const </arglist>
    </member>
    <member kind="function">
      <type>QString</type>
      <name>vertexShaderFilename</name>
      <anchorfile>classGlItem.html</anchorfile>
      <anchor>a640fe672a66241083bdf9e577a2cf737</anchor>
      <arglist>() const </arglist>
    </member>
    <member kind="function">
      <type>bool</type>
      <name>debugMovementActive</name>
      <anchorfile>classGlItem.html</anchorfile>
      <anchor>ac997f3efd096684940d5a2c40aaff43d</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="slot" protection="protected">
      <type>void</type>
      <name>handleWindowChanged</name>
      <anchorfile>classGlItem.html</anchorfile>
      <anchor>a0fc71f2632647c166e42476b9abeb328</anchor>
      <arglist>(QQuickWindow *win)</arglist>
    </member>
    <member kind="slot" protection="protected">
      <type>void</type>
      <name>onTimerTimeout</name>
      <anchorfile>classGlItem.html</anchorfile>
      <anchor>a31666a443f68f1d1bf31bacad93aae3f</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="slot" protection="protected">
      <type>void</type>
      <name>synchronizeThreads</name>
      <anchorfile>classGlItem.html</anchorfile>
      <anchor>a123ab1cc88b8a1b265499887848f437b</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="slot" protection="protected">
      <type>void</type>
      <name>deleteRenderer</name>
      <anchorfile>classGlItem.html</anchorfile>
      <anchor>a9657e9a2178f09af6ffac4a7c473273b</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function" protection="protected" virtualness="virtual">
      <type>virtual void</type>
      <name>paintUnderQmlScene</name>
      <anchorfile>classGlItem.html</anchorfile>
      <anchor>a1e334037a8d2a21e2b7b16b6c67f367d</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function" protection="protected" virtualness="virtual">
      <type>virtual void</type>
      <name>paintOnTopOfQmlScene</name>
      <anchorfile>classGlItem.html</anchorfile>
      <anchor>af4bec24bf11f37166418d9feebbccb3e</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function" protection="protected">
      <type>QVector&lt; GlPoint &gt; *</type>
      <name>points</name>
      <anchorfile>classGlItem.html</anchorfile>
      <anchor>ad68ffe65a6f480ea0c28bb1801220a36</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function" protection="protected">
      <type>QVector&lt; GLshort &gt; *</type>
      <name>indices</name>
      <anchorfile>classGlItem.html</anchorfile>
      <anchor>ac60cdc117e2484d099a015e7312c8e06</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function" protection="protected">
      <type>GLESRenderer *</type>
      <name>renderer</name>
      <anchorfile>classGlItem.html</anchorfile>
      <anchor>a00788d8d0f391455276e7255fd4aceb2</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function" protection="protected" virtualness="virtual">
      <type>virtual void</type>
      <name>setupGeometry</name>
      <anchorfile>classGlItem.html</anchorfile>
      <anchor>aed9da0a6dc5ecd691d6bcfddc31e16b1</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function" protection="protected" virtualness="virtual">
      <type>virtual void</type>
      <name>setupView</name>
      <anchorfile>classGlItem.html</anchorfile>
      <anchor>a54fde2e4b09ae6a914dd276055c0a1b7</anchor>
      <arglist>(bool clearBuffers)</arglist>
    </member>
    <member kind="function" protection="protected" virtualness="virtual">
      <type>virtual void</type>
      <name>initializeRenderer</name>
      <anchorfile>classGlItem.html</anchorfile>
      <anchor>a28e77b2ed78f3034823030b67278235e</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="variable" protection="protected">
      <type>bool</type>
      <name>m_geometryIsValid</name>
      <anchorfile>classGlItem.html</anchorfile>
      <anchor>ae39e90dbb00b6fd479f3d94df11afcf0</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable" protection="protected">
      <type>bool</type>
      <name>m_colorArrayEnabled</name>
      <anchorfile>classGlItem.html</anchorfile>
      <anchor>addb2067e924a7a878e368eb56aa5e03e</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable" protection="protected">
      <type>bool</type>
      <name>m_texturesEnabled</name>
      <anchorfile>classGlItem.html</anchorfile>
      <anchor>a307779fe2f70455e8f135aec535d3e29</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable" protection="protected">
      <type>bool</type>
      <name>m_lightingEnabled</name>
      <anchorfile>classGlItem.html</anchorfile>
      <anchor>ad069a894b891bd7e68b0bd22fee1c535</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable" protection="protected">
      <type>QVector3D</type>
      <name>m_lightDirection</name>
      <anchorfile>classGlItem.html</anchorfile>
      <anchor>a89890acd9687c86e60c038dee854cd88</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable" protection="protected">
      <type>GLfloat</type>
      <name>m_ambientLightBrightness</name>
      <anchorfile>classGlItem.html</anchorfile>
      <anchor>ac80290bdd38bb49dc09946df5303d1f7</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable" protection="protected">
      <type>GlColorRgba</type>
      <name>m_backgroundColor</name>
      <anchorfile>classGlItem.html</anchorfile>
      <anchor>ab2df52e116973be23f9cd2bae237baad</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable" protection="protected">
      <type>QVector3D</type>
      <name>m_eye</name>
      <anchorfile>classGlItem.html</anchorfile>
      <anchor>a1cfadd3f3945ed13fad83defe1d31012</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable" protection="protected">
      <type>QVector3D</type>
      <name>m_center</name>
      <anchorfile>classGlItem.html</anchorfile>
      <anchor>a9dacf0f919368f5c639e7e43b2414213</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable" protection="protected">
      <type>QVector3D</type>
      <name>m_up</name>
      <anchorfile>classGlItem.html</anchorfile>
      <anchor>af0665499c1e55e307b955aa2086dc973</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable" protection="protected">
      <type>double</type>
      <name>m_fovy</name>
      <anchorfile>classGlItem.html</anchorfile>
      <anchor>a37ddaf4a0cf8d4cc366310a685b261de</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable" protection="protected">
      <type>double</type>
      <name>m_aspect</name>
      <anchorfile>classGlItem.html</anchorfile>
      <anchor>a609199262f285dfecb8c03ea5fd28e2d</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable" protection="protected">
      <type>double</type>
      <name>m_near</name>
      <anchorfile>classGlItem.html</anchorfile>
      <anchor>aeacb1b13906a17dc392ff12bba1adf97</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable" protection="protected">
      <type>double</type>
      <name>m_far</name>
      <anchorfile>classGlItem.html</anchorfile>
      <anchor>a29d31531ae4ad0e66054eaadbf6e95a5</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable" protection="protected">
      <type>QTimer *</type>
      <name>m_timer</name>
      <anchorfile>classGlItem.html</anchorfile>
      <anchor>a31f90eee8a3490ac17ab7ef07d2984f7</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable" protection="protected">
      <type>double</type>
      <name>m_guiThreadRotation</name>
      <anchorfile>classGlItem.html</anchorfile>
      <anchor>a9e8d1cc9a5df0c3b9651a7faa5312282</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable" protection="protected">
      <type>double</type>
      <name>m_renderThreadRotation</name>
      <anchorfile>classGlItem.html</anchorfile>
      <anchor>acd44adefa479a5516d1ee3e9c9d86429</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable" protection="protected">
      <type>QString</type>
      <name>m_vertexShaderFilename</name>
      <anchorfile>classGlItem.html</anchorfile>
      <anchor>a559fad00b55c5383641033f93838a13a</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable" protection="protected">
      <type>QString</type>
      <name>m_fragmentShaderFilename</name>
      <anchorfile>classGlItem.html</anchorfile>
      <anchor>a50ed647dab93dd63c6ece3713fc23b6b</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable" protection="protected">
      <type>QVector&lt; GlPoint &gt;</type>
      <name>m_points</name>
      <anchorfile>classGlItem.html</anchorfile>
      <anchor>a023c844d6a7a43d9bb10846e890a2425</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable" protection="protected">
      <type>QVector&lt; GLshort &gt;</type>
      <name>m_indices</name>
      <anchorfile>classGlItem.html</anchorfile>
      <anchor>ae6594f536940ef1e8b85f41bd9c53dae</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable" protection="protected">
      <type>GLESRenderer *</type>
      <name>m_renderer</name>
      <anchorfile>classGlItem.html</anchorfile>
      <anchor>a616cc8845c75d934f6fa5f0cee7ae31a</anchor>
      <arglist></arglist>
    </member>
    <member kind="property">
      <type>QString</type>
      <name>vertexShaderFilename</name>
      <anchorfile>classGlItem.html</anchorfile>
      <anchor>a65bd19457968e11f254d1b8b4bd16e1c</anchor>
      <arglist></arglist>
    </member>
    <member kind="property">
      <type>QString</type>
      <name>fragmentShaderFilename</name>
      <anchorfile>classGlItem.html</anchorfile>
      <anchor>a11996f84930b805c174f67e56992d82a</anchor>
      <arglist></arglist>
    </member>
    <member kind="property">
      <type>bool</type>
      <name>debugMovementActive</name>
      <anchorfile>classGlItem.html</anchorfile>
      <anchor>a353588d5a13fc5062c4af61449ee10b3</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>GlMan</name>
    <filename>classGlMan.html</filename>
    <base>GlSphere</base>
    <member kind="function">
      <type></type>
      <name>GlMan</name>
      <anchorfile>classGlMan.html</anchorfile>
      <anchor>a88277b339f08fe8de9aa246a0122ec47</anchor>
      <arglist>(float radius=1.0, const GlColorRgba &amp;color=GlColorRgba::clBlue, const QString textureFile=&quot;&quot;, int m_stacks=18, int m_slices=36, double coneHeight=4.0)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>makeSurface</name>
      <anchorfile>classGlMan.html</anchorfile>
      <anchor>a85e06a489d9dfeae3bcf6856011965b2</anchor>
      <arglist>(QVector&lt; GlPoint &gt; *pointContainer, QVector&lt; GLshort &gt; *indexContainer)</arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>GlPoint</name>
    <filename>classGlPoint.html</filename>
    <member kind="function">
      <type></type>
      <name>GlPoint</name>
      <anchorfile>classGlPoint.html</anchorfile>
      <anchor>aedf573652bbcd5b06c7831b7bce2089a</anchor>
      <arglist>(const QVector3D &amp;vertex=QVector3D(0.0, 0.0, 0.0), const QVector3D &amp;normal=QVector3D(0.0, 1.0, 0.0), const QVector3D &amp;texCoord=QVector3D(0.0, 0.0, 0.0), const GlColorRgba &amp;color=GlColorRgba(1.0, 1.0, 1.0, 1.0))</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>~GlPoint</name>
      <anchorfile>classGlPoint.html</anchorfile>
      <anchor>aa1c7cd65c63ef588ea4250c7dcf770cb</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>QVector3D *</type>
      <name>vertexPointer</name>
      <anchorfile>classGlPoint.html</anchorfile>
      <anchor>abd34d177c39f16b54ec137fa9417a99b</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>QVector3D *</type>
      <name>normalPointer</name>
      <anchorfile>classGlPoint.html</anchorfile>
      <anchor>a22c46191eeaea95da9198c859c7cc99d</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>QVector3D *</type>
      <name>texCoordPointer</name>
      <anchorfile>classGlPoint.html</anchorfile>
      <anchor>ad5376b5f6e15d3f3db1ff304a73674d7</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>QVector4D *</type>
      <name>colorPointer</name>
      <anchorfile>classGlPoint.html</anchorfile>
      <anchor>a4c76ce5b405d5645b43fd37471fa5c25</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>move</name>
      <anchorfile>classGlPoint.html</anchorfile>
      <anchor>a62d878d474c1bb557c9aa17df4ea2739</anchor>
      <arglist>(QVector3D vMove)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>debugOutput</name>
      <anchorfile>classGlPoint.html</anchorfile>
      <anchor>ade289872ddb925a4eaf30229cfedd775</anchor>
      <arglist>(const QString &amp;prefix)</arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>GlSphere</name>
    <filename>classGlSphere.html</filename>
    <base>GlBody</base>
    <member kind="function">
      <type></type>
      <name>GlSphere</name>
      <anchorfile>classGlSphere.html</anchorfile>
      <anchor>a90de2685aa9e7162e329b534f071289f</anchor>
      <arglist>(float radius=1.0, const GlColorRgba &amp;color=GlColorRgba::clBlue, const QString textureFile=&quot;&quot;, int m_stacks=18, int slices=36)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>makeSurface</name>
      <anchorfile>classGlSphere.html</anchorfile>
      <anchor>ad434313efb71d29ba226c523d60feb21</anchor>
      <arglist>(QVector&lt; GlPoint &gt; *pointContainer, QVector&lt; GLshort &gt; *indexContainer)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>draw</name>
      <anchorfile>classGlSphere.html</anchorfile>
      <anchor>a8201103d4bd98787126f0fd001badcd8</anchor>
      <arglist>(GLESRenderer *renderer)</arglist>
    </member>
    <member kind="variable" protection="protected">
      <type>int</type>
      <name>m_stacks</name>
      <anchorfile>classGlSphere.html</anchorfile>
      <anchor>a9dd5f7b56cc58167b58232f13a9eadb4</anchor>
      <arglist></arglist>
    </member>
    <member kind="variable" protection="protected">
      <type>int</type>
      <name>m_slices</name>
      <anchorfile>classGlSphere.html</anchorfile>
      <anchor>a31d0c8023aae8af43d08b832dc5fd362</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>PlanetScene</name>
    <filename>classPlanetScene.html</filename>
    <base>GlItem</base>
    <member kind="function" virtualness="virtual">
      <type>virtual void</type>
      <name>initializeRenderer</name>
      <anchorfile>classPlanetScene.html</anchorfile>
      <anchor>a202828428555932a8eba5d648319a406</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>setupGeometry</name>
      <anchorfile>classPlanetScene.html</anchorfile>
      <anchor>af06b65ece96cda92f2d7d36ee327d6dd</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>setupView</name>
      <anchorfile>classPlanetScene.html</anchorfile>
      <anchor>a70d4a8e19046620a0be128bac78cb2f8</anchor>
      <arglist>(bool clearBuffers)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>paintUnderQmlScene</name>
      <anchorfile>classPlanetScene.html</anchorfile>
      <anchor>ab4ceac2c1c9e30c41739ebe6b6eb1e17</anchor>
      <arglist>()</arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>ShaderDebugger</name>
    <filename>classShaderDebugger.html</filename>
    <member kind="function" static="yes">
      <type>static void</type>
      <name>setEnabled</name>
      <anchorfile>classShaderDebugger.html</anchorfile>
      <anchor>af7f777abe3673cac6a93b301ef539913</anchor>
      <arglist>(bool newVal)</arglist>
    </member>
    <member kind="function" static="yes">
      <type>static void</type>
      <name>debugUniforms</name>
      <anchorfile>classShaderDebugger.html</anchorfile>
      <anchor>a349e6a16f48dd4fc161e780fa04a05c1</anchor>
      <arglist>(int programId)</arglist>
    </member>
    <member kind="function" static="yes">
      <type>static void</type>
      <name>debugMatrix4x4</name>
      <anchorfile>classShaderDebugger.html</anchorfile>
      <anchor>a475c82514222b761d049551704a12d6b</anchor>
      <arglist>(const QMatrix4x4 &amp;m, const QString &amp;caption=&quot;QMatrix4x4&quot;)</arglist>
    </member>
    <member kind="function" static="yes">
      <type>static void</type>
      <name>debugMatrix3x3</name>
      <anchorfile>classShaderDebugger.html</anchorfile>
      <anchor>a928ef5546cf0d2267313f6f7a4e738d1</anchor>
      <arglist>(const QMatrix3x3 &amp;m, const QString &amp;caption=&quot;QMatrix3x3&quot;)</arglist>
    </member>
    <member kind="function" static="yes">
      <type>static void</type>
      <name>debugVector4D</name>
      <anchorfile>classShaderDebugger.html</anchorfile>
      <anchor>ad16ea31138ee1e85a413fe8072331d06</anchor>
      <arglist>(const QVector4D &amp;v, const QString &amp;caption=&quot;QVector4D&quot;)</arglist>
    </member>
    <member kind="function" static="yes">
      <type>static void</type>
      <name>debugVector3D</name>
      <anchorfile>classShaderDebugger.html</anchorfile>
      <anchor>a2071380f8cb0657d1a1d2c8f3ebf70d3</anchor>
      <arglist>(const QVector3D &amp;v, const QString &amp;caption=&quot;QVector3D&quot;)</arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>SoundEngine</name>
    <filename>classSoundEngine.html</filename>
    <member kind="slot">
      <type>void</type>
      <name>playSound</name>
      <anchorfile>classSoundEngine.html</anchorfile>
      <anchor>a51b3e6c11e276f7d34146ab29e9922d9</anchor>
      <arglist>(const QString &amp;fileName)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>SoundEngine</name>
      <anchorfile>classSoundEngine.html</anchorfile>
      <anchor>a2bedc53fecc2fab5d9bc2661de19794b</anchor>
      <arglist>(QObject *parent=0)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>setEnabled</name>
      <anchorfile>classSoundEngine.html</anchorfile>
      <anchor>afa2ee0c61edb153b145e007dfc60196a</anchor>
      <arglist>(bool newVal)</arglist>
    </member>
    <member kind="function">
      <type>bool</type>
      <name>isEnabled</name>
      <anchorfile>classSoundEngine.html</anchorfile>
      <anchor>a3ea6dd374bdf0f7f4a8a0170fcc8b84d</anchor>
      <arglist>()</arglist>
    </member>
  </compound>
  <compound kind="page">
    <name>index</name>
    <title></title>
    <filename>index</filename>
  </compound>
</tagfile>
