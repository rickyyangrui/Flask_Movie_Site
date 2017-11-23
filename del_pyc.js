/// Global ----------------------------------------------------

var consoleOnly = true;
var defaultTimeout = 1;

var WSShell;
var fso;
var currentFolder;

var ForReading = 1, ForWriting = 2, ForAppending = 8;
var CharSetDefault = -2, CharSetUnicode = -1, CharSetAscii = 0;
var AttrNormal = 0, AttrReadOnly = 1, AttrHidden = 2, AttrSystem = 4,
AttrVolume = 8, AttrDirectory = 16, AttrArchive = 32, AttrAlias = 1024,
AttrCompressed = 2048;

Init();
Main();

function Init() {
    
    // detect command line
    try {
        WScript.StdOut.WriteLine(" ");
    } catch (e) {
        consoleOnly = false;
    }
    
    // initialize
    WSShell = new ActiveXObject("WScript.Shell");
    fso = new ActiveXObject("Scripting.FileSystemObject");
    currentFolder = GetCurrentFolder();    
}

function Main() {    
    var text;
    text = "开始处理.";
    Out(text, true);
    COut("当前工作目录: /r/n" + currentFolder);    

    var files = FindFiles("[.]*[.]pyc");    
    COut("共有 " + files.length + " 个 .pyc 文件");
    var deleted = 0;
    for(var i=0;i<files.length;i++){
        var f = fso.GetFile(files[i]);
        f.Delete(true);
        deleted++;
    }
    Out("成功删除了 " + deleted + " 个 .pyc 文件", false);
}

/// Files ------------------------------------------------------

// getcurrent folder 
function GetCurrentFolder() {    
    return fso.GetFolder(fso.GetFile(WScript.ScriptFullName).ParentFolder);
}


/// Output ------------------------------------------------------

// output 
function Out(text, useTimeout) {
    if (useTimeout) { 
        useTimeout = defaultTimeout;
    } else {
        useTimeout = -1; 
    }

    if (consoleOnly) {
        WScript.StdOut.WriteLine(text);
    } else {
        WSShell.Popup(text, useTimeout, "删除 .pyc 文件");
    }
}

// output 
function COut(text, useTimeout) {
    if (useTimeout) { 
        useTimeout = defaultTimeout;
    } else {
        useTimeout = -1; 
    }

    if (consoleOnly) {
        WScript.StdOut.WriteLine(text);
    } 
}

function ReadFile(file) {
    var stream = file.OpenAsTextStream(ForReading, CharSetDefault);
    text = stream.ReadAll();
    stream.Close();
    return text;
}

function WriteFile(file, text) {
    var ro = ((file.Attributes & AttrReadOnly) != 0);
    if (ro) file.Attributes -= AttrReadOnly;
    var stream = file.OpenAsTextStream(ForWriting, CharSetDefault);
    stream.Write(text);
    stream.Close();
    if (ro) file.Attributes += AttrReadOnly;
}

// determine, if filename matches given mask
function MatchesMask(file, mask) {
    return new RegExp(mask).test(file);
}

// find files 
function FindFiles(mask) {
    return GetFiles(currentFolder, mask);
}

// get files in current folder & subfolders
function GetFiles(folder, mask) {
    var result = new Array();
    // do files in current folder
    var files = new Enumerator(folder.Files);
    for (; !files.atEnd(); files.moveNext()) {
        if (MatchesMask(files.item(), mask)) {
            result.push("" + files.item());
        }
    }
    // do subfolders in current folder
    var folders = new Enumerator(folder.SubFolders);
    for (; !folders.atEnd(); folders.moveNext()) {
        result = result.concat(GetFiles(folders.item(), mask));
    }
    return result;
}