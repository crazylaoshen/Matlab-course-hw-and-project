%%

function CosPlotGui
   % Create and then hide the GUI as it is being constructed.
   %f = figure('Visible','off','Position',[360,500,500,300], 'Resize', 'off');     
   f = figure('Position',[360,100,500,500], 'Resize', 'off');

   % Construct the components.
   % Creates a pushbutton with the Magic 8 Ball image
%    h_image = imread('Magic8Ball.jpg');   
%    hbutton_image = uicontrol('Style','pushbutton','Position',[50,60,200+10,200+10], ...
%        'Cdata', h_image,'Callback',@hbutton_image_Callback);    
  
   % Add a Text Label  for asking the question
   h_text1 = uicontrol('Style','text','BackgroundColor',[0.8,0.8,0.8], 'FontSize',12, ...
       'Position',[100,430, 133, 20],'String','Range for x');
   % Add an Edit box where the user can type a question
   huitext1 = uicontrol('Style','edit','Position',[100,400,50,25], ...
                     'FontSize',12);   
                 
   huitext2 = uicontrol('Style','edit','Position',[180,400,50,25], ...
                     'FontSize',12);  
      
   %The answer from the magic ball   
   % Add a Text Label  for asking the question
%    h_text2 = uicontrol('Style','text','Position',[280,200,55,20], ...
%            'String','Answer', 'FontSize',12,'BackgroundColor',[0.8,0.8,0.8]); 
   % Add a Text Box  for where the Magic Ball answer appears
%    h_text3 = uicontrol('Style','text','Position', [280,170,150,25], ...
%             'BackgroundColor', 'white', 'String','', ...
%             'ForegroundColor','Red','FontSize',12);   
   
   %button to clear everything 
   hbutton_plot = uicontrol('Style','pushbutton','BackgroundColor','r',...
          'Position',[320,400,100,25],'String','Plot', 'FontSize',12,...
          'Callback',@hbutton_plot_Callback);
      
   %create axes handle for plot    
   axh = axes('Units','Pixels','Position',[120,60,300,300]);
   % Assign the GUI a name to appear in the window title.
   set(f,'Name','Cos Plot Example')
   % Move the GUI to the center of the screen.
   movegui(f,'center')
   % Make the GUI visible.
   set(f,'Visible','on');
  
 
 
   function hbutton_plot_Callback(~,~) 
      a = get(huitext1,'String');
      b = get(huitext2,'String');
      x = linspace(str2num(a),str2num(b));
      y = cos(x);
      plot(x,y);
      xlabel('x')
      ylabel('cos(x)')
   end
 
end 