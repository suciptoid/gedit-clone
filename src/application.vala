/* application.vala
 *
 * Copyright 2019 Sucipto <hi@sucipto.id>
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
 *
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

namespace Geditclone {
    public class GeditCloneApp : Gtk.Application {
        public GeditCloneApp() {
            Object(
                application_id: "org.gnome.geditclone",
                flags: ApplicationFlags.FLAGS_NONE
            );
        }

        protected override void activate() {
            Window win = new Window(this);
            win.show_all();
        }

        public static int main(string[] args) {
            GeditCloneApp app = new GeditCloneApp();
            return app.run(args);
        }
    }
}
