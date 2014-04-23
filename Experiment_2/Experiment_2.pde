import de.bezier.data.*;
import java.util.*;

void setup ()
{ash
    size( 600, 400 );

    noStroke();
    fill( 0 );
    background( 255 );
    smooth();

    XlsReader aapl_reader = new XlsReader( this, "aapl_week.xls" );
    XlsReader goog_reader = new XlsReader( this, "goog_week.xls" );

    color red = color(161,57,36);
    color green = color(26,130,50);
    writeLineGraph(aapl_reader, true, "A: ", 0, red);
    writeLineGraph(goog_reader, false, "G: ", -20, green);
    
}

void writeLineGraph(XlsReader reader, Boolean print_date, String ID, int text_offset, color line_color){

    reader.firstRow();

    int row_count = 0;
    
    float prev_x = -1;
    float prev_y = -1;
    
    float current_x = -1;
    float current_y = -1;
    
    while ( reader.hasMoreRows() ) 
    {
        row_count++;
        
        reader.nextRow();
        
        String date = reader.getString();       
        
        // skip ahead to close column
        reader.nextCell();
        reader.nextCell();
        reader.nextCell();
        reader.nextCell();
        
        int offset = 750;
        
        float close = reader.getFloat();
        
        
        float adjusted_close = -close + offset;
        
        
        current_y = adjusted_close;
        current_x = row_count*80;
        if (print_date){
          fill(0);
          text(date,row_count*70 + 5, 380);
        }
        
        fill(line_color);
        text(ID + close,row_count*70 + 5, 330 + text_offset);
        
        
        if (prev_x != -1){
          stroke(line_color);
          
          line(prev_x,prev_y,current_x,current_y);
          
          
          println(ID + current_x + ", " + current_y);
        }
        
        prev_x = current_x;
        prev_y = current_y;
        
    }
    
}
