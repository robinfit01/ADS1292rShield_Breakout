/* =========================================================
 * ====                   WARNING                        ===
 * =========================================================
 * The code in this tab has been generated from the GUI form
 * designer and care should be taken when editing this file.
 * Only add/edit code inside the event handlers i.e. only
 * use lines between the matching comment tags. e.g.

 void myBtnEvents(GButton button) { //_CODE_:button1:12356:
     // It is safe to enter your event code here  
 } //_CODE_:button1:12356:
 
 * Do not rename this tab!
 * =========================================================
 */

public void start_click(GButton source, GEvent event) { //_CODE_:start:285860:
  //println("start - GButton >> GEvent." + event + " @ " + millis());
  start.setVisible(false);
  startPlot = true;
  start.setLocalColorScheme(GCScheme.CYAN_SCHEME);
  record.setEnabled(true);
  done.setEnabled(true);
  label1.setVisible(true);
  label2.setVisible(true);
  record.setLocalColorScheme(GCScheme.GREEN_SCHEME);
} //_CODE_:start:285860:

public void portList_click(GDropList source, GEvent event) { //_CODE_:portList:554725:
  //println("portList - GDropList >> GEvent." + event + " @ " + millis());
  selectedPort = portList.getSelectedText();
  portSelected = true;
  portList.setEnabled(false);
  portList.setLocalColorScheme(GCScheme.CYAN_SCHEME);
  
} //_CODE_:portList:554725:

public void record_click(GButton source, GEvent event) { //_CODE_:record:865284:
  //println("record - GButton >> GEvent." + event + " @ " + millis());
  ////////////////////////////////////////////////////////////////////////////////
  //
  //    Enable the buttons and calls the serial port function
  //    Comselect is made true to call the serial function
  //  
  ///////////////////////////////////////////////////////////////////////////////
  try
  {
    jFileChooser = new JFileChooser();
    jFileChooser.setSelectedFile(new File("log.txt"));
    jFileChooser.showSaveDialog(null);
    String filePath = jFileChooser.getSelectedFile()+"";

    if ((filePath.equals("log.txt"))||(filePath.equals("null")))
    {
    } else
    {    
      done.setVisible(true);
      record.setVisible(false);

      start.setEnabled(false);
      close.setEnabled(false);
      start.setLocalColorScheme(GCScheme.CYAN_SCHEME);
      close.setLocalColorScheme(GCScheme.CYAN_SCHEME);
     
      logging = true;
      date = new Date();
      output = new FileWriter(jFileChooser.getSelectedFile(), true);
      bufferedWriter = new BufferedWriter(output);
      bufferedWriter.newLine();
      bufferedWriter.write(date+"");
      bufferedWriter.newLine();
      bufferedWriter.newLine();
      bufferedWriter.flush();
      bufferedWriter.close();
    }
  }
  catch(Exception e)
  {
    println("File Not Found");
  }
} //_CODE_:record:865284:

public void done_click(GButton source, GEvent event) { //_CODE_:done:510429:
  //println("done - GButton >> GEvent." + event + " @ " + millis());
  ////////////////////////////////////////////////////////////////////////////////
  //
  //    Save the file and displays a success message
  //  
  ///////////////////////////////////////////////////////////////////////////////
  if (logging == true)
  {
    showMessageDialog(null, "Log File Saved successfully");

    record.setVisible(true);
    done.setVisible(false);

    close.setEnabled(true);
    close.setLocalColorScheme(GCScheme.GREEN_SCHEME);
    record.setEnabled(true);
    record.setLocalColorScheme(GCScheme.GREEN_SCHEME);
    done.setEnabled(true);
    done.setLocalColorScheme(GCScheme.GREEN_SCHEME);
    logging = false;
  }
} //_CODE_:done:510429:

public void close_click(GButton source, GEvent event) { //_CODE_:close:309405:
  //println("close - GButton >> GEvent." + event + " @ " + millis());
  exit();
} //_CODE_:close:309405:

public void imgButton1_click1(GImageButton source, GEvent event) { //_CODE_:imgButton1:430047:
  println("imgButton1 - GImageButton >> GEvent." + event + " @ " + millis());
} //_CODE_:imgButton1:430047:



// Create all the GUI controls. 
// autogenerated do not edit
public void createGUI(){
  G4P.messagesEnabled(false);
  G4P.setGlobalColorScheme(GCScheme.BLUE_SCHEME);
  G4P.setCursor(ARROW);
  surface.setTitle("Sketch Window");
  start = new GButton(this, 260, 7, 100, 35);
  start.setText("START");
  start.setTextBold();
  start.setLocalColorScheme(GCScheme.GREEN_SCHEME);
  start.addEventHandler(this, "start_click");
  portList = new GDropList(this, 5, 7, 200, 396, 10);
  portList.setItems(loadStrings("list_554725"), 0);
  portList.setLocalColorScheme(GCScheme.GREEN_SCHEME);
  portList.addEventHandler(this, "portList_click");
  record = new GButton(this, 395, 7, 100, 35);
  record.setText("RECORD");
  record.setTextBold();
  record.setLocalColorScheme(GCScheme.GREEN_SCHEME);
  record.addEventHandler(this, "record_click");
  done = new GButton(this, 395, 7, 100, 35);
  done.setText("DONE");
  done.setTextBold();
  done.setLocalColorScheme(GCScheme.GREEN_SCHEME);
  done.addEventHandler(this, "done_click");
  close = new GButton(this, 527, 7, 100, 35);
  close.setText("CLOSE");
  close.setTextBold();
  close.setLocalColorScheme(GCScheme.GREEN_SCHEME);
  close.addEventHandler(this, "close_click");
  imgButton1 = new GImageButton(this, 897, 564, 100, 30, new String[] { "logo.png", "logo.png", "logo.png" } );
  imgButton1.addEventHandler(this, "imgButton1_click1");
  bpm1 = new GLabel(this, 558, 75, 240, 95);
  bpm1.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  bpm1.setOpaque(false);
  label1 = new GLabel(this, 460, 290, 80, 20);
  label1.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  label1.setText("My label");
  label1.setOpaque(false);
  label2 = new GLabel(this, 460, 290, 80, 20);
  label2.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  label2.setText("My label");
  label2.setOpaque(false);
}

// Variable declarations 
// autogenerated do not edit
GButton start; 
GDropList portList; 
GButton record; 
GButton done; 
GButton close; 
GImageButton imgButton1; 
GLabel bpm1; 
GLabel label1; 
GLabel label2; 