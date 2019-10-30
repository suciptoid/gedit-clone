/* window.vala
 *
 * Copyright 2019 Sucipto
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

namespace Geditclone {
	public class Window : Gtk.ApplicationWindow {

	    private Gtk.TextView textarea;

		public Window (Gtk.Application app) {
			Object (application: app);
		}

		construct {
		    // Headerbar
		    var headerbar = new Gtk.HeaderBar();
		    headerbar.show_close_button = true;
		    headerbar.title = "Gedit Clone";

		    // Open Button
		    var open_btn = new Gtk.Button.with_label("Open");
		    open_btn.clicked.connect(on_open_clicked);
		    headerbar.pack_start(open_btn);

		    // New Tab Button
		    var newtab_btn = new Gtk.Button.from_icon_name("tab-new-symbolic");
		    headerbar.pack_start(newtab_btn);

		    // Menu Button
		    var menu_btn = new Gtk.Button.from_icon_name("open-menu-symbolic");
		    headerbar.pack_end(menu_btn);

		    // Save Button
		    var save_btn = new Gtk.Button.with_label("Save");
		    headerbar.pack_end(save_btn);


		    this.set_titlebar(headerbar);

		    // Textarea
		    var textarea_scroll = new Gtk.ScrolledWindow(null,null);
		    textarea = new Gtk.TextView();
		    textarea_scroll.add(textarea);
		    this.add(textarea_scroll);

		    this.default_width = 700;
		    this.default_height = 500;
		    this.window_position = Gtk.WindowPosition.CENTER;
		}

		private void on_open_clicked() {
		    var dialog = new Gtk.FileChooserDialog(
		        "Open File", // Title
		        this, // Parent Window
		        Gtk.FileChooserAction.OPEN,
		        "Cancel",
		        Gtk.ResponseType.CANCEL,
		        "Open",
		        Gtk.ResponseType.ACCEPT
		    );

		    var res = dialog.run();
		    if (res == Gtk.ResponseType.ACCEPT) {
		       print("Selected File: %s\n".printf(dialog.get_filename()));
		       load_file(dialog.get_filename());
		    }

		    dialog.close();
		}

		private void load_file(string filename) {
		    string text;
		    FileUtils.get_contents(filename, out text);

            // Load File Content to textarea
            this.textarea.buffer.text = text;
		}
	}
}
