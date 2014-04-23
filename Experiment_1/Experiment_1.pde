import de.bezier.data.*;
import java.util.*;


// declare variables

XlsReader reader;

String title;


// setup, all the work is done here

void setup ()
{
    size( 600, 400 );

    noStroke();
    fill( 0 );
    background( 255 );
    smooth();

    LinkedList<String> dates = new LinkedList<String>();
    LinkedList close_values = new LinkedList();

    reader = new XlsReader( this, "aapl_week.xls" );

    reader.firstRow();

    title = reader.getString();    // the title of the original dataset is in the first row, first cell

    int row_count = 0;
    
    while ( reader.hasMoreRows() )    // loop thru rows
    {
        row_count++;
        // jump to first data row and its first cell
        // don't forget this or you'll be stuck in an endless loop
        reader.nextRow();
        
        String date = reader.getString();
        
        reader.nextCell();
        reader.nextCell();
        reader.nextCell();
        reader.nextCell();
        
        int offset = 350;
        
        float close = reader.getFloat();
        
        float adjusted_close = close - offset;
        
        
        rect(row_count*70, offset, 65, -adjusted_close); 
        
        text(date,row_count*70 + 5, 380);
        
        text(close,row_count*70 + 5, -adjusted_close + 330);
        //close_values.add(close);
    }
    
    println(dates);
    println(close_values);
}
