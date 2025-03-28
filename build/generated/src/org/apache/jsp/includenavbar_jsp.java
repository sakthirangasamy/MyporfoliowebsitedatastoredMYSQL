package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class includenavbar_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html lang=\"en\">\n");
      out.write("  <head>\n");
      out.write("    <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\" />\n");
      out.write("    <title>Kaiadmin - Bootstrap 5 Admin Dashboard</title>\n");
      out.write("    <meta\n");
      out.write("      content=\"width=device-width, initial-scale=1.0, shrink-to-fit=no\"\n");
      out.write("      name=\"viewport\"\n");
      out.write("    />\n");
      out.write("    <link\n");
      out.write("      rel=\"icon\"\n");
      out.write("      href=\"assets/img/kaiadmin/favicon.ico\"\n");
      out.write("      type=\"image/x-icon\"\n");
      out.write("    />\n");
      out.write("\n");
      out.write("    <!-- Fonts and icons -->\n");
      out.write("    <script src=\"assets/js/plugin/webfont/webfont.min.js\"></script>\n");
      out.write("    <script>\n");
      out.write("      WebFont.load({\n");
      out.write("        google: { families: [\"Public Sans:300,400,500,600,700\"] },\n");
      out.write("        custom: {\n");
      out.write("          families: [\n");
      out.write("            \"Font Awesome 5 Solid\",\n");
      out.write("            \"Font Awesome 5 Regular\",\n");
      out.write("            \"Font Awesome 5 Brands\",\n");
      out.write("            \"simple-line-icons\",\n");
      out.write("          ],\n");
      out.write("          urls: [\"assets/css/fonts.min.css\"],\n");
      out.write("        },\n");
      out.write("        active: function () {\n");
      out.write("          sessionStorage.fonts = true;\n");
      out.write("        },\n");
      out.write("      });\n");
      out.write("    </script>\n");
      out.write("\n");
      out.write("    <!-- CSS Files -->\n");
      out.write("    <link rel=\"stylesheet\" href=\"assets/css/bootstrap.min.css\" />\n");
      out.write("    <link rel=\"stylesheet\" href=\"assets/css/plugins.min.css\" />\n");
      out.write("    <link rel=\"stylesheet\" href=\"assets/css/kaiadmin.min.css\" />\n");
      out.write("\n");
      out.write("    <!-- CSS Just for demo purpose, don't include it in your project -->\n");
      out.write("    <link rel=\"stylesheet\" href=\"assets/css/demo.css\" />\n");
      out.write("  </head>\n");
      out.write("  <body>\n");
      out.write("        <div class=\"main-panel\">\n");
      out.write("        <div class=\"main-header\">\n");
      out.write("          <div class=\"main-header-logo\">\n");
      out.write("            <!-- Logo Header -->\n");
      out.write("            <div class=\"logo-header\" data-background-color=\"dark\">\n");
      out.write("              <a href=\"index.html\" class=\"logo\">\n");
      out.write("                <img\n");
      out.write("                  src=\"assets/img/kaiadmin/logo_light.svg\"\n");
      out.write("                  alt=\"navbar brand\"\n");
      out.write("                  class=\"navbar-brand\"\n");
      out.write("                  height=\"20\"\n");
      out.write("                />\n");
      out.write("              </a>\n");
      out.write("              <div class=\"nav-toggle\">\n");
      out.write("                <button class=\"btn btn-toggle toggle-sidebar\">\n");
      out.write("                  <i class=\"gg-menu-right\"></i>\n");
      out.write("                </button>\n");
      out.write("                <button class=\"btn btn-toggle sidenav-toggler\">\n");
      out.write("                  <i class=\"gg-menu-left\"></i>\n");
      out.write("                </button>\n");
      out.write("              </div>\n");
      out.write("              <button class=\"topbar-toggler more\">\n");
      out.write("                <i class=\"gg-more-vertical-alt\"></i>\n");
      out.write("              </button>\n");
      out.write("            </div>\n");
      out.write("            <!-- End Logo Header -->\n");
      out.write("          </div>\n");
      out.write("          <!-- Navbar Header -->\n");
      out.write("          <nav\n");
      out.write("            class=\"navbar navbar-header navbar-header-transparent navbar-expand-lg border-bottom\"\n");
      out.write("          >\n");
      out.write("            <div class=\"container-fluid\">\n");
      out.write("              <nav\n");
      out.write("                class=\"navbar navbar-header-left navbar-expand-lg navbar-form nav-search p-0 d-none d-lg-flex\"\n");
      out.write("              >\n");
      out.write("                <div class=\"input-group\">\n");
      out.write("                  <div class=\"input-group-prepend\">\n");
      out.write("                    <button type=\"submit\" class=\"btn btn-search pe-1\">\n");
      out.write("                      <i class=\"fa fa-search search-icon\"></i>\n");
      out.write("                    </button>\n");
      out.write("                  </div>\n");
      out.write("                  <input\n");
      out.write("                    type=\"text\"\n");
      out.write("                    placeholder=\"Search ...\"\n");
      out.write("                    class=\"form-control\"\n");
      out.write("                  />\n");
      out.write("                </div>\n");
      out.write("              </nav>\n");
      out.write("\n");
      out.write("              <ul class=\"navbar-nav topbar-nav ms-md-auto align-items-center\">\n");
      out.write("                <li\n");
      out.write("                  class=\"nav-item topbar-icon dropdown hidden-caret d-flex d-lg-none\"\n");
      out.write("                >\n");
      out.write("                  <a\n");
      out.write("                    class=\"nav-link dropdown-toggle\"\n");
      out.write("                    data-bs-toggle=\"dropdown\"\n");
      out.write("                    href=\"#\"\n");
      out.write("                    role=\"button\"\n");
      out.write("                    aria-expanded=\"false\"\n");
      out.write("                    aria-haspopup=\"true\"\n");
      out.write("                  >\n");
      out.write("                    <i class=\"fa fa-search\"></i>\n");
      out.write("                  </a>\n");
      out.write("                  <ul class=\"dropdown-menu dropdown-search animated fadeIn\">\n");
      out.write("                    <form class=\"navbar-left navbar-form nav-search\">\n");
      out.write("                      <div class=\"input-group\">\n");
      out.write("                        <input\n");
      out.write("                          type=\"text\"\n");
      out.write("                          placeholder=\"Search ...\"\n");
      out.write("                          class=\"form-control\"\n");
      out.write("                        />\n");
      out.write("                      </div>\n");
      out.write("                    </form>\n");
      out.write("                  </ul>\n");
      out.write("                </li>\n");
      out.write("                <li class=\"nav-item topbar-icon dropdown hidden-caret\">\n");
      out.write("                  <a\n");
      out.write("                    class=\"nav-link dropdown-toggle\"\n");
      out.write("                    href=\"#\"\n");
      out.write("                    id=\"messageDropdown\"\n");
      out.write("                    role=\"button\"\n");
      out.write("                    data-bs-toggle=\"dropdown\"\n");
      out.write("                    aria-haspopup=\"true\"\n");
      out.write("                    aria-expanded=\"false\"\n");
      out.write("                  >\n");
      out.write("                    <i class=\"fa fa-envelope\"></i>\n");
      out.write("                  </a>\n");
      out.write("                  <ul\n");
      out.write("                    class=\"dropdown-menu messages-notif-box animated fadeIn\"\n");
      out.write("                    aria-labelledby=\"messageDropdown\"\n");
      out.write("                  >\n");
      out.write("                    <li>\n");
      out.write("                      <div\n");
      out.write("                        class=\"dropdown-title d-flex justify-content-between align-items-center\"\n");
      out.write("                      >\n");
      out.write("                        Messages\n");
      out.write("                        <a href=\"#\" class=\"small\">Mark all as read</a>\n");
      out.write("                      </div>\n");
      out.write("                    </li>\n");
      out.write("                    <li>\n");
      out.write("                      <div class=\"message-notif-scroll scrollbar-outer\">\n");
      out.write("                        <div class=\"notif-center\">\n");
      out.write("                          <a href=\"#\">\n");
      out.write("                            <div class=\"notif-img\">\n");
      out.write("                              <img\n");
      out.write("                                src=\"assets/img/jm_denis.jpg\"\n");
      out.write("                                alt=\"Img Profile\"\n");
      out.write("                              />\n");
      out.write("                            </div>\n");
      out.write("                            <div class=\"notif-content\">\n");
      out.write("                              <span class=\"subject\">Jimmy Denis</span>\n");
      out.write("                              <span class=\"block\"> How are you ? </span>\n");
      out.write("                              <span class=\"time\">5 minutes ago</span>\n");
      out.write("                            </div>\n");
      out.write("                          </a>\n");
      out.write("                          <a href=\"#\">\n");
      out.write("                            <div class=\"notif-img\">\n");
      out.write("                              <img\n");
      out.write("                                src=\"assets/img/chadengle.jpg\"\n");
      out.write("                                alt=\"Img Profile\"\n");
      out.write("                              />\n");
      out.write("                            </div>\n");
      out.write("                            <div class=\"notif-content\">\n");
      out.write("                              <span class=\"subject\">Chad</span>\n");
      out.write("                              <span class=\"block\"> Ok, Thanks ! </span>\n");
      out.write("                              <span class=\"time\">12 minutes ago</span>\n");
      out.write("                            </div>\n");
      out.write("                          </a>\n");
      out.write("                          <a href=\"#\">\n");
      out.write("                            <div class=\"notif-img\">\n");
      out.write("                              <img\n");
      out.write("                                src=\"assets/img/mlane.jpg\"\n");
      out.write("                                alt=\"Img Profile\"\n");
      out.write("                              />\n");
      out.write("                            </div>\n");
      out.write("                            <div class=\"notif-content\">\n");
      out.write("                              <span class=\"subject\">Jhon Doe</span>\n");
      out.write("                              <span class=\"block\">\n");
      out.write("                                Ready for the meeting today...\n");
      out.write("                              </span>\n");
      out.write("                              <span class=\"time\">12 minutes ago</span>\n");
      out.write("                            </div>\n");
      out.write("                          </a>\n");
      out.write("                          <a href=\"#\">\n");
      out.write("                            <div class=\"notif-img\">\n");
      out.write("                              <img\n");
      out.write("                                src=\"assets/img/talha.jpg\"\n");
      out.write("                                alt=\"Img Profile\"\n");
      out.write("                              />\n");
      out.write("                            </div>\n");
      out.write("                            <div class=\"notif-content\">\n");
      out.write("                              <span class=\"subject\">Talha</span>\n");
      out.write("                              <span class=\"block\"> Hi, Apa Kabar ? </span>\n");
      out.write("                              <span class=\"time\">17 minutes ago</span>\n");
      out.write("                            </div>\n");
      out.write("                          </a>\n");
      out.write("                        </div>\n");
      out.write("                      </div>\n");
      out.write("                    </li>\n");
      out.write("                    <li>\n");
      out.write("                      <a class=\"see-all\" href=\"javascript:void(0);\"\n");
      out.write("                        >See all messages<i class=\"fa fa-angle-right\"></i>\n");
      out.write("                      </a>\n");
      out.write("                    </li>\n");
      out.write("                  </ul>\n");
      out.write("                </li>\n");
      out.write("                <li class=\"nav-item topbar-icon dropdown hidden-caret\">\n");
      out.write("                  <a\n");
      out.write("                    class=\"nav-link dropdown-toggle\"\n");
      out.write("                    href=\"#\"\n");
      out.write("                    id=\"notifDropdown\"\n");
      out.write("                    role=\"button\"\n");
      out.write("                    data-bs-toggle=\"dropdown\"\n");
      out.write("                    aria-haspopup=\"true\"\n");
      out.write("                    aria-expanded=\"false\"\n");
      out.write("                  >\n");
      out.write("                    <i class=\"fa fa-bell\"></i>\n");
      out.write("                    <span class=\"notification\">4</span>\n");
      out.write("                  </a>\n");
      out.write("                  <ul\n");
      out.write("                    class=\"dropdown-menu notif-box animated fadeIn\"\n");
      out.write("                    aria-labelledby=\"notifDropdown\"\n");
      out.write("                  >\n");
      out.write("                    <li>\n");
      out.write("                      <div class=\"dropdown-title\">\n");
      out.write("                        You have 4 new notification\n");
      out.write("                      </div>\n");
      out.write("                    </li>\n");
      out.write("                    <li>\n");
      out.write("                      <div class=\"notif-scroll scrollbar-outer\">\n");
      out.write("                        <div class=\"notif-center\">\n");
      out.write("                          <a href=\"#\">\n");
      out.write("                            <div class=\"notif-icon notif-primary\">\n");
      out.write("                              <i class=\"fa fa-user-plus\"></i>\n");
      out.write("                            </div>\n");
      out.write("                            <div class=\"notif-content\">\n");
      out.write("                              <span class=\"block\"> New user registered </span>\n");
      out.write("                              <span class=\"time\">5 minutes ago</span>\n");
      out.write("                            </div>\n");
      out.write("                          </a>\n");
      out.write("                          <a href=\"#\">\n");
      out.write("                            <div class=\"notif-icon notif-success\">\n");
      out.write("                              <i class=\"fa fa-comment\"></i>\n");
      out.write("                            </div>\n");
      out.write("                            <div class=\"notif-content\">\n");
      out.write("                              <span class=\"block\">\n");
      out.write("                                Rahmad commented on Admin\n");
      out.write("                              </span>\n");
      out.write("                              <span class=\"time\">12 minutes ago</span>\n");
      out.write("                            </div>\n");
      out.write("                          </a>\n");
      out.write("                          <a href=\"#\">\n");
      out.write("                            <div class=\"notif-img\">\n");
      out.write("                              <img\n");
      out.write("                                src=\"assets/img/profile2.jpg\"\n");
      out.write("                                alt=\"Img Profile\"\n");
      out.write("                              />\n");
      out.write("                            </div>\n");
      out.write("                            <div class=\"notif-content\">\n");
      out.write("                              <span class=\"block\">\n");
      out.write("                                Reza send messages to you\n");
      out.write("                              </span>\n");
      out.write("                              <span class=\"time\">12 minutes ago</span>\n");
      out.write("                            </div>\n");
      out.write("                          </a>\n");
      out.write("                          <a href=\"#\">\n");
      out.write("                            <div class=\"notif-icon notif-danger\">\n");
      out.write("                              <i class=\"fa fa-heart\"></i>\n");
      out.write("                            </div>\n");
      out.write("                            <div class=\"notif-content\">\n");
      out.write("                              <span class=\"block\"> Farrah liked Admin </span>\n");
      out.write("                              <span class=\"time\">17 minutes ago</span>\n");
      out.write("                            </div>\n");
      out.write("                          </a>\n");
      out.write("                        </div>\n");
      out.write("                      </div>\n");
      out.write("                    </li>\n");
      out.write("                    <li>\n");
      out.write("                      <a class=\"see-all\" href=\"javascript:void(0);\"\n");
      out.write("                        >See all notifications<i class=\"fa fa-angle-right\"></i>\n");
      out.write("                      </a>\n");
      out.write("                    </li>\n");
      out.write("                  </ul>\n");
      out.write("                </li>\n");
      out.write("                <li class=\"nav-item topbar-icon dropdown hidden-caret\">\n");
      out.write("                  <a\n");
      out.write("                    class=\"nav-link\"\n");
      out.write("                    data-bs-toggle=\"dropdown\"\n");
      out.write("                    href=\"#\"\n");
      out.write("                    aria-expanded=\"false\"\n");
      out.write("                  >\n");
      out.write("                    <i class=\"fas fa-layer-group\"></i>\n");
      out.write("                  </a>\n");
      out.write("                  <div class=\"dropdown-menu quick-actions animated fadeIn\">\n");
      out.write("                    <div class=\"quick-actions-header\">\n");
      out.write("                      <span class=\"title mb-1\">Quick Actions</span>\n");
      out.write("                      <span class=\"subtitle op-7\">Shortcuts</span>\n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"quick-actions-scroll scrollbar-outer\">\n");
      out.write("                      <div class=\"quick-actions-items\">\n");
      out.write("                        <div class=\"row m-0\">\n");
      out.write("                          <a class=\"col-6 col-md-4 p-0\" href=\"#\">\n");
      out.write("                            <div class=\"quick-actions-item\">\n");
      out.write("                              <div class=\"avatar-item bg-danger rounded-circle\">\n");
      out.write("                                <i class=\"far fa-calendar-alt\"></i>\n");
      out.write("                              </div>\n");
      out.write("                              <span class=\"text\">Calendar</span>\n");
      out.write("                            </div>\n");
      out.write("                          </a>\n");
      out.write("                          <a class=\"col-6 col-md-4 p-0\" href=\"#\">\n");
      out.write("                            <div class=\"quick-actions-item\">\n");
      out.write("                              <div\n");
      out.write("                                class=\"avatar-item bg-warning rounded-circle\"\n");
      out.write("                              >\n");
      out.write("                                <i class=\"fas fa-map\"></i>\n");
      out.write("                              </div>\n");
      out.write("                              <span class=\"text\">Maps</span>\n");
      out.write("                            </div>\n");
      out.write("                          </a>\n");
      out.write("                          <a class=\"col-6 col-md-4 p-0\" href=\"#\">\n");
      out.write("                            <div class=\"quick-actions-item\">\n");
      out.write("                              <div class=\"avatar-item bg-info rounded-circle\">\n");
      out.write("                                <i class=\"fas fa-file-excel\"></i>\n");
      out.write("                              </div>\n");
      out.write("                              <span class=\"text\">Reports</span>\n");
      out.write("                            </div>\n");
      out.write("                          </a>\n");
      out.write("                          <a class=\"col-6 col-md-4 p-0\" href=\"#\">\n");
      out.write("                            <div class=\"quick-actions-item\">\n");
      out.write("                              <div\n");
      out.write("                                class=\"avatar-item bg-success rounded-circle\"\n");
      out.write("                              >\n");
      out.write("                                <i class=\"fas fa-envelope\"></i>\n");
      out.write("                              </div>\n");
      out.write("                              <span class=\"text\">Emails</span>\n");
      out.write("                            </div>\n");
      out.write("                          </a>\n");
      out.write("                          <a class=\"col-6 col-md-4 p-0\" href=\"#\">\n");
      out.write("                            <div class=\"quick-actions-item\">\n");
      out.write("                              <div\n");
      out.write("                                class=\"avatar-item bg-primary rounded-circle\"\n");
      out.write("                              >\n");
      out.write("                                <i class=\"fas fa-file-invoice-dollar\"></i>\n");
      out.write("                              </div>\n");
      out.write("                              <span class=\"text\">Invoice</span>\n");
      out.write("                            </div>\n");
      out.write("                          </a>\n");
      out.write("                          <a class=\"col-6 col-md-4 p-0\" href=\"#\">\n");
      out.write("                            <div class=\"quick-actions-item\">\n");
      out.write("                              <div\n");
      out.write("                                class=\"avatar-item bg-secondary rounded-circle\"\n");
      out.write("                              >\n");
      out.write("                                <i class=\"fas fa-credit-card\"></i>\n");
      out.write("                              </div>\n");
      out.write("                              <span class=\"text\">Payments</span>\n");
      out.write("                            </div>\n");
      out.write("                          </a>\n");
      out.write("                        </div>\n");
      out.write("                      </div>\n");
      out.write("                    </div>\n");
      out.write("                  </div>\n");
      out.write("                </li>\n");
      out.write("\n");
      out.write("                <li class=\"nav-item topbar-user dropdown hidden-caret\">\n");
      out.write("                  <a\n");
      out.write("                    class=\"dropdown-toggle profile-pic\"\n");
      out.write("                    data-bs-toggle=\"dropdown\"\n");
      out.write("                    href=\"#\"\n");
      out.write("                    aria-expanded=\"false\"\n");
      out.write("                  >\n");
      out.write("                    <div class=\"avatar-sm\">\n");
      out.write("                      <img\n");
      out.write("                        src=\"assets/img/profile.jpg\"\n");
      out.write("                        alt=\"...\"\n");
      out.write("                        class=\"avatar-img rounded-circle\"\n");
      out.write("                      />\n");
      out.write("                    </div>\n");
      out.write("                    <span class=\"profile-username\">\n");
      out.write("                      <span class=\"op-7\">Hi,</span>\n");
      out.write("                      <span class=\"fw-bold\">Hizrian</span>\n");
      out.write("                    </span>\n");
      out.write("                  </a>\n");
      out.write("                  <ul class=\"dropdown-menu dropdown-user animated fadeIn\">\n");
      out.write("                    <div class=\"dropdown-user-scroll scrollbar-outer\">\n");
      out.write("                      <li>\n");
      out.write("                        <div class=\"user-box\">\n");
      out.write("                          <div class=\"avatar-lg\">\n");
      out.write("                            <img\n");
      out.write("                              src=\"assets/img/profile.jpg\"\n");
      out.write("                              alt=\"image profile\"\n");
      out.write("                              class=\"avatar-img rounded\"\n");
      out.write("                            />\n");
      out.write("                          </div>\n");
      out.write("                          <div class=\"u-text\">\n");
      out.write("                            <h4>Hizrian</h4>\n");
      out.write("                            <p class=\"text-muted\">hello@example.com</p>\n");
      out.write("                            <a\n");
      out.write("                              href=\"profile.html\"\n");
      out.write("                              class=\"btn btn-xs btn-secondary btn-sm\"\n");
      out.write("                              >View Profile</a\n");
      out.write("                            >\n");
      out.write("                          </div>\n");
      out.write("                        </div>\n");
      out.write("                      </li>\n");
      out.write("                      <li>\n");
      out.write("                        <div class=\"dropdown-divider\"></div>\n");
      out.write("                        <a class=\"dropdown-item\" href=\"#\">My Profile</a>\n");
      out.write("                        <a class=\"dropdown-item\" href=\"#\">My Balance</a>\n");
      out.write("                        <a class=\"dropdown-item\" href=\"#\">Inbox</a>\n");
      out.write("                        <div class=\"dropdown-divider\"></div>\n");
      out.write("                        <a class=\"dropdown-item\" href=\"#\">Account Setting</a>\n");
      out.write("                        <div class=\"dropdown-divider\"></div>\n");
      out.write("                        <a class=\"dropdown-item\" href=\"#\">Logout</a>\n");
      out.write("                      </li>\n");
      out.write("                    </div>\n");
      out.write("                  </ul>\n");
      out.write("                </li>\n");
      out.write("              </ul>\n");
      out.write("            </div>\n");
      out.write("          </nav>\n");
      out.write("          <!-- End Navbar -->\n");
      out.write("        </div>\n");
      out.write("        \n");
      out.write("      <!-- Custom template | don't include it in your project! -->\n");
      out.write("     \n");
      out.write("      <!-- End Custom template -->\n");
      out.write("    </div\n");
      out.write("    <!--   Core JS Files   -->\n");
      out.write("    <script src=\"assets/js/core/jquery-3.7.1.min.js\"></script>\n");
      out.write("    <script src=\"assets/js/core/popper.min.js\"></script>\n");
      out.write("    <script src=\"assets/js/core/bootstrap.min.js\"></script>\n");
      out.write("\n");
      out.write("    <!-- jQuery Scrollbar -->\n");
      out.write("    <script src=\"assets/js/plugin/jquery-scrollbar/jquery.scrollbar.min.js\"></script>\n");
      out.write("\n");
      out.write("    <!-- Chart JS -->\n");
      out.write("    <script src=\"assets/js/plugin/chart.js/chart.min.js\"></script>\n");
      out.write("\n");
      out.write("    <!-- jQuery Sparkline -->\n");
      out.write("    <script src=\"assets/js/plugin/jquery.sparkline/jquery.sparkline.min.js\"></script>\n");
      out.write("\n");
      out.write("    <!-- Chart Circle -->\n");
      out.write("    <script src=\"assets/js/plugin/chart-circle/circles.min.js\"></script>\n");
      out.write("\n");
      out.write("    <!-- Datatables -->\n");
      out.write("    <script src=\"assets/js/plugin/datatables/datatables.min.js\"></script>\n");
      out.write("\n");
      out.write("    <!-- Bootstrap Notify -->\n");
      out.write("    <!--<script src=\"assets/js/plugin/bootstrap-notify/bootstrap-notify.min.js\"></script>-->\n");
      out.write("\n");
      out.write("    <!-- jQuery Vector Maps -->\n");
      out.write("    <script src=\"assets/js/plugin/jsvectormap/jsvectormap.min.js\"></script>\n");
      out.write("    <script src=\"assets/js/plugin/jsvectormap/world.js\"></script>\n");
      out.write("\n");
      out.write("    <!-- Sweet Alert -->\n");
      out.write("    <script src=\"assets/js/plugin/sweetalert/sweetalert.min.js\"></script>\n");
      out.write("\n");
      out.write("    <!-- Kaiadmin JS -->\n");
      out.write("    <script src=\"assets/js/kaiadmin.min.js\"></script>\n");
      out.write("\n");
      out.write("    <!-- Kaiadmin DEMO methods, don't include it in your project! -->\n");
      out.write("    <script src=\"assets/js/setting-demo.js\"></script>\n");
      out.write("    <script src=\"assets/js/demo.js\"></script>\n");
      out.write("    <script>\n");
      out.write("      $(\"#lineChart\").sparkline([102, 109, 120, 99, 110, 105, 115], {\n");
      out.write("        type: \"line\",\n");
      out.write("        height: \"70\",\n");
      out.write("        width: \"100%\",\n");
      out.write("        lineWidth: \"2\",\n");
      out.write("        lineColor: \"#177dff\",\n");
      out.write("        fillColor: \"rgba(23, 125, 255, 0.14)\",\n");
      out.write("      });\n");
      out.write("\n");
      out.write("      $(\"#lineChart2\").sparkline([99, 125, 122, 105, 110, 124, 115], {\n");
      out.write("        type: \"line\",\n");
      out.write("        height: \"70\",\n");
      out.write("        width: \"100%\",\n");
      out.write("        lineWidth: \"2\",\n");
      out.write("        lineColor: \"#f3545d\",\n");
      out.write("        fillColor: \"rgba(243, 84, 93, .14)\",\n");
      out.write("      });\n");
      out.write("\n");
      out.write("      $(\"#lineChart3\").sparkline([105, 103, 123, 100, 95, 105, 115], {\n");
      out.write("        type: \"line\",\n");
      out.write("        height: \"70\",\n");
      out.write("        width: \"100%\",\n");
      out.write("        lineWidth: \"2\",\n");
      out.write("        lineColor: \"#ffa534\",\n");
      out.write("        fillColor: \"rgba(255, 165, 52, .14)\",\n");
      out.write("      });\n");
      out.write("    </script>\n");
      out.write("  </body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
