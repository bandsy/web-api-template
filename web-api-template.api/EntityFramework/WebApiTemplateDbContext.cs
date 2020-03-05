using Microsoft.EntityFrameworkCore;

namespace web_api_template.api.EntityFramework {
    public class WebApiTemplateDbContext : DbContext {
        public WebApiTemplateDbContext (DbContextOptions<WebApiTemplateDbContext> options) : base (options) {
            //db sets here
        }
    }
}