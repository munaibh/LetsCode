import java.awt.AlphaComposite;
import java.awt.BorderLayout;
import java.awt.Color;
import java.awt.Dimension;
import java.awt.Graphics;
import java.awt.Graphics2D;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.*;
import javax.swing.border.EmptyBorder;



public class MainGUI implements ActionListener {
	
	private JFrame frame;
	private JPanel panel;

	public MainGUI() {
		
		newElements();
		styleElements();
		addElements();
		
	}
	
	
	public void newElements() {
		
		frame = new JFrame();
		panel = new JPanel();
		
	}
	
	
	public void addElements() {
		
		frame.setUndecorated(true);
		frame.setContentPane(new ShadowPane());
        frame.setBackground(new Color(0,0,0,0)); 
		frame.add(panel);
		frame.setSize(1100, 800);
		frame.setLocationRelativeTo(null);
		frame.setDefaultCloseOperation(WindowConstants.DISPOSE_ON_CLOSE);
		frame.setVisible(true);
		
	}
	
	
	public void styleElements() {
		
    	panel.setBackground(new Color(0xf8f8f8));
		
	}

	
	public void actionPerformed(ActionEvent arg0) {
		
	}
	
	
	public class ShadowPane extends JPanel {

		public ShadowPane() {
			setLayout(new BorderLayout());
	        setOpaque(false);
	        setBackground(Color.BLACK);
	        setBorder(new EmptyBorder(12, 12, 2, 2));
	    }

	    public Dimension getPreferredSize() {
	    	return new Dimension(200, 200);
	    }

	    protected void paintComponent(Graphics g) {
	    	super.paintComponent(g);
	    	Graphics2D g2d = (Graphics2D) g.create();
	    	g2d.setComposite(AlphaComposite.SrcOver.derive(0.2f));
	    	g2d.fillRect(10, 10, getWidth(), getHeight());
	    	g2d.dispose();
	    }
	  
	}

}