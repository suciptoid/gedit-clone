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
		    var textarea = new Gtk.TextView();
		    this.add(textarea);

		    this.default_width = 700;
		    this.default_height = 500;
		    this.window_position = Gtk.WindowPosition.CENTER;
		}
	}
}
