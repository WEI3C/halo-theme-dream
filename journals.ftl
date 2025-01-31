<#include "template/layout.ftl">
<#include "template/main/comment.ftl">
<@layout title="${journals_title!'动态'} - ${blog_title!}" canonical="${journals_url!}">
    <#if journals.content?? && journals.content?size gt 0>
        <#list journals.content as journal>
            <div class="card card-content journal">
                <p class="journal-date">
                    <i class="ri-send-plane-line"></i>
                    <em>${journal.createTime?string('yyyy年MM月dd日 HH:mm:ss')}</em>
                </p>
                <div class="journal-content fold">
                    <div data-id="${journal.id?c}" data-target="journals" class="main-content not-toc">${journal.content}</div>
                </div>
                <div class="journal-operation">
                    <span class="journal-operation-item">
                        <a class="like" data-id="${journal.id?c}" data-likes="${(journal.likes!0)?c}"><i
                                    class="ri-heart-3-line"></i><em>${(journal.likes != 0)?string(journal.likes?c,'喜欢')}</em></a>
                    </span>

                    <#if enable_comment>
                    <span class="journal-operation-item">
                        <a class="comment"><i
                                    class="ri-message-3-line"></i><em><#if journal.commentCount==0>评论<#else>${journal.commentCount}</#if></em></a>
                    </span>
                    </#if>
                    <#if enable_share>
                    <span class="journal-operation-item">
                        <a class="share"><i class="ri-share-forward-line"></i><em>分享</em></a>
                    </span>
                    </#if>
                </div>
                <#if enable_comment>
                <div class="journal-comment">
                    <@comment journal.id?c, "journal" />
                </div>
                </#if>
            </div>
        </#list>
        <#include "template/main/pagination.ftl">
        <@pagination method="journals" datas=journals display="${settings.page_number!5}" />
    <#else>
        <div class="card card-empty">
            <i class="ri-inbox-2-fill"></i>
            目前沒有任何動態，回<a href="${context!}">主頁</a>看看吧
        </div>
    </#if>
</@layout>
