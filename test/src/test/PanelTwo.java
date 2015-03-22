package test;
import java.awt.CardLayout;
import java.awt.Color;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.JButton;
import javax.swing.JPanel;

class PanelTwo extends JPanel {

    JButton buttonTwo;
    CardLayout layout;
    JPanel panelCont;

    public PanelTwo(final CardLayout layout, final JPanel panelCont) {
        this.layout = layout;
        this.panelCont = panelCont;
        buttonTwo = new JButton("Go to one");

        add(buttonTwo);
        setBackground(Color.GREEN);

        buttonTwo.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                layout.show(panelCont, "1");
            }
        });

    }
}