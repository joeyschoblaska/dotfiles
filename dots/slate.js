// https://github.com/mattr-/slate

// 27" width: 2560
// ultrawide: 3440

var minColumnWidth = 850;
var idealGutterWidth = 2;

var screenWidth = function () {
  return slate.screen().rect().width;
};

var numColumns = function () {
  return 2;
  // if (screenWidth() < minColumnWidth * 2 + idealGutterWidth) {
  //   return 1;
  // } else if (screenWidth() < minColumnWidth * 3 + idealGutterWidth * 2) {
  //   return 2;
  // } else {
  //   return 3;
  // }
};

var columnWidth = function () {
  switch (numColumns()) {
    case 1:
      return screenWidth();
    case 2:
      return Math.floor((screenWidth() - idealGutterWidth) / 2);
    case 3:
      return Math.floor((screenWidth() - idealGutterWidth * 2) / 3);
  }
};

var gutterWidth = function () {
  switch (numColumns()) {
    case 1:
      return 0;
    case 2:
      return screenWidth() - columnWidth() * 2;
    case 3:
      return Math.floor((screenWidth() - columnWidth() * 3) / 2);
  }
};

var altCenterWidth = function () {
  if (numColumns() > 1) {
    return columnWidth() * 1.66;
  } else {
    return columnWidth();
  }
};

var altLeftRightWidth = function () {
  if (numColumns() > 2) {
    return columnWidth() * 2 + gutterWidth();
  } else {
    return columnWidth();
  }
};

// operations
var fullscreen = function () {
  return slate.operation("move", {
    x: "screenOriginX",
    y: "screenOriginY",
    width: "screenSizeX",
    height: "screenSizeY",
  });
};

var moveRight = function (win) {
  var isNormalX = parseInt(win.rect().x) == screenWidth() - columnWidth();
  var width = isNormalX ? altLeftRightWidth() : columnWidth();
  var x = screenWidth() - width;

  return slate.operation("move", {
    x: x,
    y: "screenOriginY",
    width: width,
    height: "screenSizeY",
  });
};

var moveLeft = function (win) {
  var isNormalX = parseInt(win.rect().x) == 0;
  var isNormalWidth = parseInt(win.rect().width) == columnWidth();
  var width = isNormalX && isNormalWidth ? altLeftRightWidth() : columnWidth();

  return slate.operation("move", {
    x: "screenOriginX",
    y: "screenOriginY",
    width: width,
    height: "screenSizeY",
  });
};

var moveCenter = function (win) {
  var center = screenWidth() / 2;
  var isNormalX =
    parseInt(win.rect().x) == parseInt(center - columnWidth() / 2);
  var isNormalWidth = parseInt(win.rect().width) == columnWidth();
  var width = isNormalX && isNormalWidth ? altCenterWidth() : columnWidth();
  var x = center - width / 2;

  return slate.operation("move", {
    x: x,
    y: "screenOriginY",
    width: width,
    height: "screenSizeY",
  });
};

// bindings
slate.bind("k:ctrl", function (win) {
  win.doOperation(fullscreen());
});

slate.bind("l:ctrl", function (win) {
  win.doOperation(moveRight(win));
});

slate.bind("h:ctrl", function (win) {
  win.doOperation(moveLeft(win));
});

slate.bind("j:ctrl", function (win) {
  win.doOperation(moveCenter(win));
});
