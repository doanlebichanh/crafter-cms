<#-- layout.ftl - Template chính (FreeMarker) -->
<!doctype html>
<html lang="vi">
<head>
  <meta charset="utf-8">
  <title>${title?if_exists?html} - ${siteName?if_exists?html}</title>
  <meta name="description" content="${metaDescription?if_exists?html}">
  <meta name="viewport" content="width=device-width,initial-scale=1">
  <link rel="stylesheet" href="${staticBaseUrl?if_exists:'/static'}/css/main.css">
</head>
<body>
  <#-- Header -->
  <#include "header.ftl">

  <main class="container">
    <#-- Hero component -->
    <#if hero??>
      <#include "components/hero.ftl">
    </#if>

    <section class="services">
      <h2>${servicesTitle! 'Dịch vụ của chúng tôi'}</h2>
      <div class="service-grid">
        <#if services??>
          <#list services as s>
            <#include "components/service-card.ftl">
          </#list>
        <#else>
          <p>Chưa có dịch vụ nào được cấu hình.</p>
        </#if>
      </div>
    </section>

    <section class="content">
      <h2>${contentTitle! ''}</h2>
      <div class="rich-text">
        ${contentBody?no_esc}
      </div>
    </section>

    <section class="cta">
      <a class="btn primary" href="${quoteUrl!'/get-quote'}">Yêu cầu báo giá</a>
    </section>
  </main>

  <#-- Footer -->
  <#include "footer.ftl">

  <script>
    // Ví dụ nhỏ: chuyển form tracking tới route /tracking (cần route xử lý ở server/Crafter)
    function submitTracking(e){
      e.preventDefault();
      var code = document.getElementById('tracking-code').value;
      if(!code) return alert('Vui lòng nhập mã theo dõi');
      window.location.href = '/tracking?code=' + encodeURIComponent(code);
    }
  </script>
</body>
</html>
