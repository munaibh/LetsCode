import java.awt.AlphaComposite;
import java.awt.BorderLayout;
import java.awt.Color;
import java.awt.Dimension;
import java.awt.Graphics;
import java.awt.Graphics2D;
import java.awt.Image;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.io.File;
import java.io.IOException;

import javax.imageio.ImageIO;
import javax.swing.*;
import javax.swing.border.EmptyBorder;

import net.miginfocom.swing.MigLayout;



public class MainGUI implements ActionListener {
	
	private JFrame frame;
	private JLabel logo;
	private JPanel panel, header, wrapper, backnext, settings, controls;
	private JButton exitBtn, miniBtn, maxiBtn, nextBtn, backBtn, settBtn;

	public MainGUI() {
		
		newElements();
		styleElements();
		addElements();
		
	}
	
	
	public void newElements() {
		
		frame = new JFrame();
		panel = new JPanel();
		
    	header   = new JPanel();
		wrapper  = new JPanel();
		backnext = new JPanel();
    	controls = new JPanel();
    	settings = new JPanel();
    	
    	backBtn  = new JButton();
    	nextBtn  = new JButton();	
    	settBtn  = new JButton();
    	maxiBtn  = new JButton();
    	exitBtn  = new JButton();
    	miniBtn  = new JButton();
    	
    	exitBtn.addActionListener(this);
    	miniBtn.addActionListener(this);
    	
    	panel.setLayout(new MigLayout("insets 0"));
    	header.setLayout(new MigLayout("insets 15, gap 0"));
    	backnext.setLayout(new MigLayout("insets 0, gap 0"));
    	controls.setLayout(new MigLayout("insets 0, gap 0"));
    	settings.setLayout(new MigLayout("insets 0, gap 0"));

		
	}
	
	
	public void addElements() {
		
		
		backnext.add(backBtn);
    	backnext.add(nextBtn);
 
    	settings.add(settBtn, "right, push, gap 10 10");
    	controls.add(maxiBtn, "right, push");
    	controls.add(miniBtn, "right");
    	controls.add(exitBtn, "right");
    	
    	header.add(backnext, "w 200px");
    	header.add(logo,     "push, growx");
    	header.add(settings, "w 73px, gap 10 10");
    	header.add(controls, "w 60px");
		
    	panel.add(header, "growx, hmax 90px, top, wrap");
		panel.add(wrapper, "push, grow, top");

		
		panel.add(header, "growx, hmax 90px, top, wrap");
		panel.add(wrapper, "push, grow, top");
		
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
		
		// Add Logo
		

    	try {
            Image image = ImageIO.read(new File("assets/img/logo.png"));
			Image  resized  = image.getScaledInstance(55, 55,Image.SCALE_SMOOTH);
            ImageIcon logoImage = new ImageIcon(resized);
    		logo = new JLabel(logoImage);
    		
        } catch (IOException k) { k.printStackTrace(); }
    	
    	
    	header.setBackground(Color.WHITE);
    	panel.setBackground(new Color(0xf8f8f8));
    	wrapper.setBackground(new Color(0,0,0,0));
		header.setBorder(BorderFactory.createMatteBorder(0, 0, 1, 0, new Color(0xeef1f1)));

		
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
