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

public void portList_click(GDropList source, GEvent event) { //_CODE_:portList:640344:
  //println("portList - GDropList >> GEvent." + event + " @ " + millis());
  selectedPort = portList.getSelectedText();
  startSerial();
} //_CODE_:portList:640344:

public void record_click(GButton source, GEvent event) { //_CODE_:record:731936:
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
    jFileChooser.setSelectedFile(new File("log.csv"));
    jFileChooser.showSaveDialog(null);
    String filePath = jFileChooser.getSelectedFile()+"";

    if ((filePath.equals("log.txt"))||(filePath.equals("null")))
    {
    } else
    {    
 //     done.setVisible(true);
      record.setVisible(false);
      close.setEnabled(false);
      close.setLocalColorScheme(GCScheme.CYAN_SCHEME);
      logging = true;
      date = new Date();
      output = new FileWriter(jFileChooser.getSelectedFile(), true);
      bufferedWriter = new BufferedWriter(output);
      bufferedWriter.write(date.toString()+"");
      bufferedWriter.newLine();
      bufferedWriter.write("TimeStramp,ECG,SpO2,Respiration");
      bufferedWriter.newLine();
    }
  }
  catch(Exception e)
  {
    println("File Not Found");
  }
} //_CODE_:record:731936:

public void close_click(GButton source, GEvent event) { //_CODE_:close:222350:
  //println("close - GButton >> GEvent." + event + " @ " + millis());
  int dialogResult = JOptionPane.showConfirmDialog (null, "Would You Like to Close The Application?");
  if (dialogResult == JOptionPane.YES_OPTION) {
    try
    {
      //Runtime runtime = Runtime.getRuntime();
      //Process proc = runtime.exec("sudo shutdown -h now");
      System.exit(0);
    }
    catch(Exception e)
    {
      exit();
    }
  } else
  {
  }
} //_CODE_:close:222350:

public void imgButton1_click1(GImageButton source, GEvent event) { //_CODE_:imgButton1:665258:
  println("imgButton1 - GImageButton >> GEvent." + event + " @ " + millis());
} //_CODE_:imgButton1:665258:



// Create all the GUI controls. 
// autogenerated do not edit
public void createGUI(){
  G4P.messagesEnabled(false);
  G4P.setGlobalColorScheme(GCScheme.BLUE_SCHEME);
  G4P.setCursor(ARROW);
  surface.setTitle("ECG/Respiration");
  portList = new GDropList(this, 5, 7, 200, 385, 10);
  portList.setItems(loadStrings("list_640344"), 0);
  portList.setLocalColorScheme(GCScheme.GREEN_SCHEME);
  portList.addEventHandler(this, "portList_click");
  record = new GButton(this, 236, 7, 100, 40);
  record.setText("RECORD");
  record.setTextBold();
  record.setLocalColorScheme(GCScheme.GREEN_SCHEME);
  record.addEventHandler(this, "record_click");
  close = new GButton(this, 347, 7, 100, 40);
  close.setText("CLOSE");
  close.setTextBold();
  close.setLocalColorScheme(GCScheme.GREEN_SCHEME);
  close.addEventHandler(this, "close_click");
  imgButton1 = new GImageButton(this, 488, 3, 277, 48, new String[] { "logo.png", "logo.png", "logo.png" } );
  imgButton1.addEventHandler(this, "imgButton1_click1");
  lbl_hr = new GLabel(this, 900, 190, 200, 58);
  lbl_hr.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  lbl_hr.setText("---");
  lbl_hr.setTextBold();
  lbl_hr.setOpaque(false);
  lbl_hr.setFont(new Font("Monospaced", Font.PLAIN, 40));
  lbl_hr.setLocalColorScheme(GCScheme.YELLOW_SCHEME);
/*  lbl_rtor = new GLabel(this, 900, 100, 250, 62);
  lbl_rtor.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  lbl_rtor.setText("---");
  lbl_rtor.setTextBold();
  lbl_rtor.setLocalColorScheme(GCScheme.YELLOW_SCHEME);
  lbl_rtor.setOpaque(false);*/
  
  label11 = new GLabel(this, 300, 300, 190, 40);
  label11.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
 // label11.setText("Heart Rate (BPM)");
  label11.setTextBold();
  label11.setLocalColorScheme(GCScheme.YELLOW_SCHEME);
  label11.setOpaque(false);
  
  label1 = new GLabel(this, 900, 100, 200, 100);
 // label1.setFont("Impact");
    label1.setFont(new Font("Monospaced", Font.BOLD, 22));
  label1.setTextBold();
  label1.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  label1.setText("Heart. Rate (BPM)");
  label1.setOpaque(false);

  label1.setLocalColorScheme(GCScheme.YELLOW_SCHEME);
}

// Variable declarations 
// autogenerated do not edit
GDropList portList; 
GButton record; 
GButton close; 
GImageButton imgButton1; 
GLabel lbl_hr; 
GLabel lbl_rtor; 
GLabel label11; 
GLabel label1; 