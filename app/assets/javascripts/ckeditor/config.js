// if formatting is done improperly full list of features is included by default.
// http://docs.cksource.com/CKEditor_3.x/Developers_Guide/Toolbar

  CKEDITOR.config.toolbar = [
    { name: 'styles', items : [ 'Font','FontSize', 'Styles','Format' ] },
    { name: 'basicstyles', items : [ 'Bold','Italic','Underline','Strike','Subscript','Superscript','-','RemoveFormat' ] },
    { name: 'document', items : [ 'Source','-','Save','DocProps','Preview','Print','-' ] },  // 'Templates'
    { name: 'clipboard', items : [ 'Cut','Copy','Paste','PasteText','PasteFromWord','-','Undo','Redo' ] },
    { name: 'editing', items : [ 'Find','Replace','-','Scayt' ] },
    { name: 'insert', items : [ 'Image','Table','HorizontalRule','Smiley','SpecialChar','PageBreak','Iframe' ] }, //'Flash'
    { name: 'paragraph', items : [ 'NumberedList','BulletedList','-','Outdent','Indent','-','Blockquote','CreateDiv', '-','JustifyLeft','JustifyCenter','JustifyRight','JustifyBlock','-','BidiLtr','BidiRtl' ] },
    { name: 'links', items : [ 'Link','Unlink','Anchor' ] },
    { name: 'colors', items : [ 'TextColor','BGColor' ] },
    { name: 'tools', items : [ 'Maximize', 'ShowBlocks' ] },
    { name: 'forms', items : [ 'Checkbox']}, //'Radio', 'Select', 'Button', 'ImageButton'
  ]

  CKEDITOR.config.height = '400px';
